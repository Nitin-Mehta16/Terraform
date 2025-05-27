variable "name" {
    type = string
}

variable "age" {
    type = number
}

output "intro" {
    value = "Hello, my name is ${var.name} and I am ${var.age} years old."  
}

//terraform plan -var "name=nitin" -var "age=19"
