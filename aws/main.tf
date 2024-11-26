provider "aws" {
  # We will get aws credentials from aws-cli
  region = "ap-south-1"
}

resource "aws_instance" "myos1" {
  ami           = "ami-0aebec83a182ea7ea"
  instance_type = "t2.micro"
  tags = {
    Name = "Server_1"
    Team = "Dev"
  }
}

output "allDetails" {
  value = aws_instance.myos1
}

output "ip_id" {
  value = "Ip adress of your aws Instance is ${aws_instance.myos1.public_ip} and id is ${aws_instance.myos1.id}"
}

output "state" {
  value = "State of your instance is ${aws_instance.myos1.instance_state}"
}
