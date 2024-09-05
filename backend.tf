terraform {
  backend "s3" {
    bucket = "devops-aug-state-bucket"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "tf-state-dynamodb-tabke"
  }
}
