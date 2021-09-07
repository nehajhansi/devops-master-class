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
#state
#desired(what is that we want)   known(what is previous executed the json content the state file)     actual(what is actually present now after all the executions done in the cloud)
#when the terraform apply is applied then it goes to the refreshing state and compares the present execution with the known execution...if there are no changes then it will deploy in secs
#terraform is declarative i.e it compares the desired state with actual state and makes it equal
resource "aws_iam_user" "my_iam_user" {
    name = "my_iam_user_abc_updated"
}
