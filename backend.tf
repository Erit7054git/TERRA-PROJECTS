
terraform {
  backend "s3" {
    bucket  = "besrat-66terraform-remote-state"
    key     = "jupiter-website-ecs.tfstate"
    region  = "us-east-1"
    dynamodb_table = "dynamodb-state-locking"
  }
}
