resource "aws_instance" "backend" {
  ami             = var.aws_amis[var.aws_region]
  instance_type   = var.aws_instance_types["beckend"]
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.healthcaretokens_service.name]

  tags = {
    Name = "Healthcare token backend service"
  }
}

resource "aws_instance" "nhso_web" {
  ami             = var.aws_amis[var.aws_region]
  instance_type   = var.aws_instance_types["webapp"]
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.healthcaretokens_service.name]

  tags = {
    Name = "Healthcare token NHSO web app"
  }
}

resource "aws_instance" "hospital_web" {
  ami             = var.aws_amis[var.aws_region]
  instance_type   = var.aws_instance_types["webapp"]
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.healthcaretokens_service.name]

  tags = {
    Name = " Healthcare token hospital web app"
  }
}

resource "aws_instance" "sms" {
  ami             = var.aws_amis[var.aws_region]
  instance_type   = var.aws_instance_types["sms"]
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.healthcaretokens_sms.name]

  tags = {
    Name = "Healthcare token sms service"
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
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.healthcaretokens_db.id]
}