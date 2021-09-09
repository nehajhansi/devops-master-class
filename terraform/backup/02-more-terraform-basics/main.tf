#terraform plan -out iam.tfplan  = storing plan to a file
#terraform apply "iam.tfplan" = using plan to apply(no comparision againn\, FASTER)
#terraform apply -target="aws_iam_user.my_iam_user" = ONLY state of that specific user is being updated
variable "iam_user_name_prefix" {
  type    = string #any, number, bool, list, map, set, object, tuple
  default = "my_iam_user"
}

provider "aws" {
  region  = "us-east-1"
  //version = "~> 2.46" (No longer necessary)
}

resource "aws_iam_user" "my_iam_users" {
  count = 1 #the no of users you want to create
  name  = "${var.iam_user_name_prefix}_${count.index}"
}
#terraform console is used to get the values by indexes
#terraform fmt = used to format
#terraform show = provides readable format of state file
#export TF_VAR_iam_user_name_prefix = FROM_ENV_VARIABLE_IAM_PREFIX = override the default value(least priority) and u can do that by tfvars file aswell and from command line aswell use double quotes(higher priority)
