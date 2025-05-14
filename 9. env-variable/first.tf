variable "name" {
}

output "intro" {
  value = "Hello my name is ${var.name}"
}

#  export TF_VAR_name=nitin   ( TF_VAR_variable-name=_______ )
#  echo $TF_VAR_name

# ~ terraform plan     (it will automatically pick the env variable)
# Changes to Outputs:
#   + intro = "Hello my name is nitin"