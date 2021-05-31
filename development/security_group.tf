resource "aws_security_group" "healthcaretokens_web" {
  name        = "healthcaretokens-web"
  description = "Security group for healthcare token"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "healthcaretokens_backend" {
  name        = "healthcaretokens-backend"
  description = "Security group for healthcare token"

  # HTTP access from healthcaretokens_web SG
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.healthcaretokens_web.id]
  }
}