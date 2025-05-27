output "sg-name" {
  value = module.create_ec2.sg-name
}

output "key-name" {
  value = module.create_ec2.key-name
}

output "public-ip" {
  value = module.create_ec2.public-ip
}