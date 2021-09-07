output "my_s3_bucket_versioning" {
    value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled 
    #provider_resource.resource_name.any attributes name is used to get values from the console 
    #terraform apply -refresh=false(no checking) (and now the output is displayed)
}

output "my_s3_bucket_complete_details" {
    value = aws_s3_bucket.my_s3_bucket
}

output "my_iam_user_complete_details" {
    value = aws_iam_user.my_iam_user
}
