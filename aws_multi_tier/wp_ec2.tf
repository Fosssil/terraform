resource "aws_instance" "wpOS" {
  ami                    = "ami-0327f51db613d7bd2"
  instance_type          = "t2.micro"
  key_name               = "tf_aws"
  vpc_security_group_ids = [aws_security_group.wp-sg.id]
  subnet_id              = aws_subnet.lw_public_subnet_1a.id
  tags = {
    Name = "Wordpress Site"
  }
}

resource "time_sleep" "wait_1m" {
  depends_on      = [aws_instance.wpOS]
  create_duration = "1m"
}

## Setting up provisioner and connection block in null_resources
resource "null_resource" "null_remote" {
  depends_on = [time_sleep.wait_1m]
  provisioner "remote-exec" {
    inline = [
      "sudo yum install git httpd -y",
      "sudo amazon-linux-extras install -y php8.2 mariadb10.5",
      "sudo git clone https://github.com/WordPress/WordPress.git",
      "sudo mv WordPress/* /var/www/html/",
      "sudo chown -R apache /var/www/html/",
      "sudo systemctl restart httpd"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/Downloads/tf_aws.pem")
    host        = aws_instance.wpOS.public_ip
  }
}

## Open firefox browser
resource "null_resource" "null_local" {
  depends_on = [time_sleep.wait_1m, null_resource.null_remote]
  provisioner "local-exec" {
    command = "firefox http://${aws_instance.wpOS.public_ip}/"
  }
}
