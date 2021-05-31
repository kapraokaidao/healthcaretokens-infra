resource "aws_instance" "backend" {
  ami           = var.aws_amis[var.aws_region]
  instance_type = "t2.micro"
  key_name = "healthcaretokens"
  security_groups = [aws_security_group.healthcaretokens_service.name]

  tags = {
    Name = "Healthcare token backend"
  }
}

resource "aws_instance" "nhso_web" {
  ami           = var.aws_amis[var.aws_region]
  instance_type = "t2.micro"
  key_name = "healthcaretokens"
  security_groups = [aws_security_group.healthcaretokens_service.name]

  tags = {
    Name = "NHSO web app"
  }
}

resource "aws_instance" "hospital_web" {
  ami           = var.aws_amis[var.aws_region]
  instance_type = "t2.micro"
  key_name = "healthcaretokens"
  security_groups = [aws_security_group.healthcaretokens_service.name]

  tags = {
    Name = "Hospital web app"
  }
}

resource "aws_db_instance" "healthcaretokens" {
  identifier             = "healthcaretokens"
  engine                 = "mysql"
  engine_version         = "8.0.20"
  instance_class         = "db.t2.micro"
  allocated_storage      = 10
  name                   = "healthcaretokens"
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.healthcaretokens_db.id]
}