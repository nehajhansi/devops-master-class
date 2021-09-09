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
# KNOWN STATE- IT IS PRESENT IN THE STATE FILE...It contains the mapping from the terraform name of the resource to the aws identifier of the specific resource and when we perform apply the id in the state file is compared.
#when the terraform apply is applied then it goes to the refreshing state and compares the present execution with the known execution...if there are no changes then it will deploy in secs
#terraform is declarative i.e it compares the desired state with actual state and makes it equal
resource "aws_iam_user" "my_iam_user" { #name of the resource in terraform
    name = "my_iam_user_abc_updated" #name in the cloud
}
#you can't store the state file anywhere because it has some confidential information which can't be publically available(so never evr commit them)
#so direct store it in remote backend i.e in the s3 bucket of the cloud
# terraform apply and destroy both refresh the states at the beginning
