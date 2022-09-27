output "instance_ips" {
    value = {
        for k, v in aws_instance.web : k => v.public_ip
    }
}
