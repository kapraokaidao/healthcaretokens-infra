resource "aws_instance" "backend" {
    ami = var.aws_amis[var.aws_region]
    instance_type = "t2.micro"

    security_groups = [aws_security_group.healthcaretokens_backend.name]

    tags = {
        Name = "Healthcare token backend"
    }
}

resource "aws_instance" "nhso_web" {
    ami = var.aws_amis[var.aws_region]
    instance_type = "t2.micro"

    security_groups = [aws_security_group.healthcaretokens_web.name]

    tags = {
        Name = "NHSO web app"
    }
}

resource "aws_instance" "hospital_web" {
    ami = var.aws_amis[var.aws_region]
    instance_type = "t2.micro"

    security_groups = [aws_security_group.healthcaretokens_web.name]

    tags = {
        Name = "Hospital web app"
    }
}