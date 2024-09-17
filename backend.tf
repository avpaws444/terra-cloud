
terraform {
  backend s3{
    bucket = "prasadbucket111"
    key = "remote.tfstate"
    region = "us-east-1"
  }
}


