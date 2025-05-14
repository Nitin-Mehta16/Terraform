variable users {
  type = map
  default = {
    "nitin" = 20
    "ritika" = 25
    "mohit" = 30
    "daksh" = 35
    "kriti" = 40
    "bua" = 45
  }
}

#terraform plan -var "users={"nitin" = 20",ritika" = 25,"mohit" = 30,"daksh" = 35,"kriti" = 40,"bua" = 45}"

variable name {
    type = string
    default = "nitin"
}

//terraform plan -var "users={"nitin" = 20",ritika" = 25,"mohit" = 30,"daksh" = 35,"kriti" = 40,"bua" = 45}"  -var "name=ritika"

output "introduction" {
  value = "hello,my name is ${var.name} and my age is ${lookup(var.users, var.name)}"
  
}