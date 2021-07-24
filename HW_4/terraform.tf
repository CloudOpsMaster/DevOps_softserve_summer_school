provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "Ubuntu" {
  count                  = 1
  ami                    = "ami-090f10efc254eaf55"
  instance_type          = "t3.small"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  user_data              = file("webserver.sh")

  tags = {
    Name    = "Amazon apach2"
    Owner   = "Vadym Tailor"
    Project = "SoftServe HW 4"
  }

}


resource "aws_security_group" "webserver" {
  name        = "webserver Security Group"
  description = "Allow TLS inbound traffic"


  ingress {
    description      = "tcp port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "tcp port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow http"
  }
}
