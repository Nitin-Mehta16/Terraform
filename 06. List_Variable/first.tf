output print {
    value = "user list --> ${var.user[0]} and age is ${var.age}"
}

//terraform function
output join_function {
    value = "user list --> ${join("->",var.user)} and age is ${var.age}"
}

output upper_function {
    value = "user list --> ${upper(var.user[0])} and age is ${var.age}"
}

output lower_function {
    value = "user list --> ${lower(var.user[1])} and age is ${var.age}"
}

output title_function {
    value = "user list --> ${title(var.user[2])} and age is ${var.age}"
}