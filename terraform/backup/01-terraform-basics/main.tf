provider "aws" {  #whatever cloud u want to use and when it is executed the required plugins are installed
    region = "us-east-1"
    //version = "~> 2.46" (No longer necessary)
}

# plan - execute 
#(terraform plan tells us what terraform will do if u execute that particular code)(and the actions that will be performed)
#(terraform apply again shows us the plan and if u enter yes then the action will be performed)
#after terraform apply the terraform.tfstate file is created which is in json
resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-in28minutes-rangak-002"
    versioning {
        enabled = true
    }
}

resource "aws_iam_user" "my_iam_user" {
    name = "my_iam_user_abc_updated"
}
