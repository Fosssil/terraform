provider "aws" {
  region = "ap-south-1"
}

## Create ec2 instance
resource "aws_instance" "myweb" {
  ami             = "ami-0aebec83a182ea7ea"
  instance_type   = "t2.micro"
  key_name        = "tf_aws"  # we will automate  this
  security_groups = ["tf_sg"] # We can use multiple SGs that's why it is a list
  tags = {
    Name = "WebServer"
    User = "Terraform"
  }
}

## Creating EBS volume
resource "aws_ebs_volume" "myebs" {
  size              = 2
  availability_zone = aws_instance.myweb.availability_zone
  tags = {
    Name = "Extra_Backup_volume"
  }
}

## Attaching volume to our ec2-instance
resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.myebs.id
  instance_id = aws_instance.myweb.id
}
## Null resource to wait until the instance is running
resource "null_resource" "wait_for_instance" {
  depends_on = [aws_instance.myweb]

  provisioner "local-exec" {
    command = <<EOT
while true; do
  state=$(aws ec2 describe-instance-status --instance-ids ${aws_instance.myweb.id} --query 'InstanceStatuses[0].InstanceState.Name' --output text)
  if [ "$state" == "running" ]; then
    break
  fi
  sleep 5
done
EOT
  }
}

## Setting up provisioner and connection block in null_resources
resource "null_resource" "null_remote" {
  depends_on = [null_resource.wait_for_instance]
  provisioner "remote-exec" {
    inline = [
      "sudo mkfs.xfs /dev/xvdb",
      "sudo yum install httpd -y",
      "sudo mount /dev/xvdb /var/www/html",
      "sudo sh -c 'echo Hi My name is SAGAR DAHIYA > /var/www/html/index.html'",
      "sudo systemctl restart httpd"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/Downloads/tf_aws.pem")
    host        = aws_instance.myweb.public_ip
  }
}

## Open firefox browser
resource "null_resource" "null_local" {
  provisioner "local-exec" {
    command = "firefox http://${aws_instance.myweb.public_ip}/"
  }
}
