output print_name{
    value =  "hello , ${var.name}"
}

//terraform plan   -->    "hello , default value --> linux"

output age {
    value =  "your age is , ${var.age}"
}

//terraform plan -var "name=macOS" -var "age=3"