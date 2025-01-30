resource "aws_key_pair" "self" {
  key_name   = "tfe-public-key"
  public_key = var.ec2_instance_connect_ssh_public_key
}

# TFE Hosts

resource "aws_launch_template" "tfe" {
  name                   = "tfe-web-asg-lt"
  image_id               = data.aws_ami.debian.id
  instance_type          = var.ec2_tfe_instance_type
  key_name               = aws_key_pair.self.key_name
  update_default_version = true
  user_data              = base64encode(file("${path.module}/scripts/tfe-host-debian-user-data.sh"))

  monitoring {
    enabled = true
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.tfe.name
  }

  network_interfaces {
    security_groups = [aws_security_group.tfe.id]
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_type = "gp3"
      volume_size = 50
      throughput  = 125
      iops        = 3000
      encrypted   = true
    }
  }

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.ec2_tfe_instance_name
    }
  }

  # It is important that the RDS instance is up and running before we try to deploy the TFE Hosts.
  depends_on = [
    aws_db_instance.tfe
  ]
}

resource "aws_autoscaling_group" "tfe" {
  name                      = var.asg_name
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  vpc_zone_identifier       = module.vpc.private_subnets
  health_check_grace_period = 300
  health_check_type         = "ELB"

  launch_template {
    id      = aws_launch_template.tfe.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.tfe.id]
}

# Application Load Balancer

resource "aws_lb" "tfe" {
  name                       = var.lb_name
  load_balancer_type         = "application"
  internal                   = false
  subnets                    = module.vpc.public_subnets
  security_groups            = [aws_security_group.alb.id]
  drop_invalid_header_fields = true
}

resource "aws_lb_listener" "tfe" {
  load_balancer_arn = aws_lb.tfe.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = aws_acm_certificate_validation.tfe.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tfe.arn
  }
}

resource "aws_lb_target_group" "tfe" {
  name     = var.lb_target_group_name
  port     = 443
  protocol = "HTTPS"
  vpc_id   = module.vpc.vpc_id

  health_check {
    protocol            = "HTTPS"
    path                = "/_health_check"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 60
    matcher             = 200
  }
}
