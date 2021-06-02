resource "aws_instance" "backend" {
  ami             = var.aws_amis[var.aws_region]
  instance_type   = var.aws_instance_types["backend"]
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.healthcaretokens_service.name]

  tags = {
    Name = "Healthcare token backend service"
  }

  provisioner "file" {
    source      = "./resources/backend/setup.sh"
    destination = "setup.sh"
  }

  provisioner "file" {
    source      = "./resources/backend/.env.example"
    destination = ".env"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +xr setup.sh"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.key_pair_path)
    host        = self.public_ip
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

  provisioner "file" {
    source      = "./resources/nhso/setup.sh"
    destination = "setup.sh"
  }

  provisioner "file" {
    source      = "./resources/nhso/.env.example"
    destination = ".env"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +xr setup.sh"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.key_pair_path)
    host        = self.public_ip
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

  provisioner "file" {
    source      = "./resources/hospital/setup.sh"
    destination = "setup.sh"
  }

  provisioner "file" {
    source      = "./resources/hospital/.env.example"
    destination = ".env"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +xr setup.sh"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.key_pair_path)
    host        = self.public_ip
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

  provisioner "file" {
    source      = "./resources/sms/setup.sh"
    destination = "setup.sh"
  }

  provisioner "file" {
    source      = "./resources/sms/.env.example"
    destination = ".env"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +xr setup.sh"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.key_pair_path)
    host        = self.public_ip
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