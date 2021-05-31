variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-1"
}

variable "aws_amis" {
  default = {
    ap-southeast-1 = "ami-02f26adf094f51167"
  }
}