# Create VPC
resource "aws_vpc" "working-vpc" {
  cidr_block           = var.VPC_cidr
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  instance_tenancy     = "default"

}

# Create Public Subnet for EC2
resource "aws_subnet" "subnet-public-1" {
  vpc_id                  = aws_vpc.working-vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = data.aws_availability_zones.available.names[0]

}

# Create Private subnet for RDS
resource "aws_subnet" "subnet-private-1" {
  vpc_id                  = aws_vpc.working-vpc.id
  cidr_block              = var.private_subneta_cidr
  map_public_ip_on_launch = "false" //it makes private subnet
  availability_zone       = data.aws_availability_zones.available.names[1]

}

# Create second Private subnet for RDS
resource "aws_subnet" "subnet-private-2" {
  vpc_id                  = aws_vpc.working-vpc.id
  cidr_block              = var.private_subnetb_cidr
  map_public_ip_on_launch = "false" //it makes private subnet
  availability_zone       = data.aws_availability_zones.available.names[0]

}



# Create IGW for internet connection 
resource "aws_internet_gateway" "working-igw" {
  vpc_id = aws_vpc.working-vpc.id

}

# Creating Route table 
resource "aws_route_table" "public-crt" {
  vpc_id = aws_vpc.working-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.working-igw.id
  }


}


# Associating route tabe to public subnet
resource "aws_route_table_association" "crta-public-subnet-1" {
  subnet_id      = aws_subnet.subnet-public-1.id
  route_table_id = aws_route_table.public-crt.id
}