resource "aws_elastic_beanstalk_environment" "beanstalk_app_env" {
  name                = "${var.beanstalk_app_env}-${var.env}"
  application         = aws_elastic_beanstalk_application.beanstalk_app.name
  solution_stack_name = var.solution_stack_name
  tier                = var.tier

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "True"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", var.subnet_ids)
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MESSAGE"
    value     = "API v1 ${var.env}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.ssh_key_name
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = join(",", [aws_security_group.beanstalk_app_sg.id])
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200-299"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = lookup(var.asg_sizes, "min_size")
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = lookup(var.asg_sizes, "max_size")
  }

  depends_on = [
    aws_elastic_beanstalk_application.beanstalk_app,
    aws_elastic_beanstalk_application_version.application_version,
    aws_security_group.beanstalk_app_sg,
  ]
}

output "beanstalk_app_env" {
  value = aws_elastic_beanstalk_environment.beanstalk_app_env
}
