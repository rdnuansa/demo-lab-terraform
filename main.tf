resource "aws_instance" "lab-vm-1" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"

  tags = {
    Name = "lab-vm-1"
  }

  subnet_id = aws_subnet.lab-vpc-subnet-1.id
}

resource "aws_instance" "lab-vm-2" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"

  tags = {
    Name = "lab-vm-2"
  }

  subnet_id = aws_subnet.lab-vpc-subnet-2.id
}

# resource "aws_instance" "lab-vm-sg" {
#   ami           = "ami-0778521d914d23bc1"
#   instance_type = "t1.micro"

#   tags = {
#     Name = "lab-vm-sg"
#   }

#   associate_public_ip_address = true
#   subnet_id                   = aws_subnet.lab-vpc-subnet-2.id
#   vpc_security_group_ids      = [aws_security_group.lab-security-group.id]
# }

resource "aws_instance" "lab-vm-ssh" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t1.micro"

  tags = {
    Name = "lab-vm-ssh-accessible"
  }

  associate_public_ip_address = true
  subnet_id                   = aws_subnet.lab-vpc-subnet-2.id
  vpc_security_group_ids      = [aws_security_group.lab-security-group.id]
  key_name                    = aws_key_pair.lab-deployer.key_name
}

resource "aws_instance" "lab-vm-default-subnet" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t1.micro"

  tags = {
    Name = "lab-vm-default-subnet"
  }

  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.target-subnet.id
  key_name                    = aws_key_pair.lab-deployer.key_name
}

resource "aws_instance" "lab-vm-with-variable" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "lab-vm-default-subnet"
  }

  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.target-subnet.id
  key_name                    = aws_key_pair.lab-deployer.key_name
}

resource "aws_key_pair" "lab-deployer" {
  key_name   = "lab-deployer"
  public_key = var.public_key
}