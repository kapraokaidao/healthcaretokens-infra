variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-northeast-1"
}

variable "aws_amis" {
  default = {
    ap-southeast-1 = "ami-0d058fe428540cd89"
    ap-northeast-1 = "ami-0df99b3a8349462c6"
  }
}

variable "aws_instance_types" {
  default = {
    backend = "t2.small"
    webapp  = "t2.small"
    sms     = "t2.small"
  }
}

variable "key_pair_name" {
  default = "healthcaretokens"
}

variable "key_pair_path" {
  description = "Path to key pair file in local machine (can be relative path)"
  type        = string
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}
