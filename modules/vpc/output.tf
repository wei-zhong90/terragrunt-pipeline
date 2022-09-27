output "vpc_id" {
    value = aws_vpc.working-vpc.id
}

output "public_subnet_id" {
    value = aws_subnet.subnet-public-1.id
}

output "private_subnet_1_id" {
    value = aws_subnet.subnet-private-1.id
}

output "private_subnet_2_id" {
    value = aws_subnet.subnet-private-2.id
}