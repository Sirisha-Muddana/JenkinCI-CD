################################################################################
# VPC Resources
################################################################################

resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr

  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.name}-subnet"
  }
}

resource "aws_network_interface" "interface" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "${var.name}-interface"
  }
}

################################################################################
# aws_instance Resources
################################################################################

resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = {
    Name = "${var.name}-Ec2"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.name}1111122-bucket"

  tags = {
    Name = "${var.name}-bucket"
  }
}


################################################################################
# rds Resources
################################################################################


resource "aws_rds_cluster" "rds" {
  cluster_identifier      = "${var.name}-aurora"
  availability_zones      = [var.availability_zone]
  database_name           = "${var.name}db"
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
}
