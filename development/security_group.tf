resource "aws_security_group" "healthcaretokens_service" {
  name        = "healthcaretokens-service"
  description = "Security group for healthcare token"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_security_group" "healthcaretokens_db" {
  name        = "healthcaretokens-db"
  description = "Security group for healthcare token"

  # HTTP access from healthcaretokens_backend SG
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.healthcaretokens_service.id]
  }

   # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "healthcaretokens_sms" {
  name        = "healthcaretokens-sms"
  description = "Security group for healthcare token"

  # HTTP access from healthcaretokens_backend SG
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.healthcaretokens_service.id]
  }

   # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}