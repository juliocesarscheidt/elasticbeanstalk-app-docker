variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "env" {
  type        = string
  description = "Environment"
  default     = "development"
}

####################### Network Configs #######################
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "IDs of subnets"
}

####################### Beanstalk Configs #######################
variable "beanstalk_app" {
  type    = string
  default = "beanstalk-app"
}

variable "beanstalk_app_env" {
  type    = string
  default = "beanstalk-app-env"
}

variable "solution_stack_name" {
  type = string
  # More info: https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.docker
  default = "64bit Amazon Linux 2 v3.4.13 running Docker"
}

variable "tier" {
  type    = string
  default = "WebServer"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name for accessing instances"
}

variable "asg_sizes" {
  type        = map(number)
  description = "Min and Max sizes for ASG"
  default = {
    min_size = 1
    max_size = 1
  }
}

####################### Other Configs #######################
variable "tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ { BusinessUnit : ABC })"
  default     = {}
}
