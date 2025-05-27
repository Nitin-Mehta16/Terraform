# output "printing_rsa_key_location" {
#     value = "${path.module}/id_rsa.pub"    //path.module --> cpwd
#     description = "Location of the public key"
# }

# output "printing_content_of_file" {
#   value = file("${path.module}/id_rsa.pub")
#   description = "Content of the public key"
# }