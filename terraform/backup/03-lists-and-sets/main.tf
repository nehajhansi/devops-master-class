variable "names" {
  default = ["ravs", "tom", "jane"]
  #default = ["ranga", "tom", "jane"]
}

provider "aws" {
  region  = "us-east-1"
  //version = "~> 2.46" (No longer necessary)
}

resource "aws_iam_user" "my_iam_users" {
  #count = length(var.names)
  #name  = var.names[count.index] # if u use this then the rest of elements are also affected (here key is position)
  for_each = toset(var.names) #here only extra element is added instead of changing everything (here key is value)
  name = each.value
}
