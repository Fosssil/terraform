// Public subnets
resource "aws_subnet" "lw_public_subnet_1a" {
  vpc_id                  = aws_vpc.sagar_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 1a TF"
  }
}

resource "aws_subnet" "lw_public_subnet_1b" {
  vpc_id                  = aws_vpc.sagar_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 1b TF"
  }
}

resource "aws_subnet" "lw_public_subnet_1c" {
  vpc_id                  = aws_vpc.sagar_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 1c TF"
  }
}

// Private subnets
resource "aws_subnet" "lw_private_subnet_1b" {
  vpc_id                  = aws_vpc.sagar_vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 1b TF"
  }
}

resource "aws_subnet" "lw_private_subnet_1c" {
  vpc_id                  = aws_vpc.sagar_vpc.id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 1c TF"
  }
}
