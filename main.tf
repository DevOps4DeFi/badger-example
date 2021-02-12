provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket         = "tfstate-vlk-badger"                      ##TODO change to the name of the terraform bucket created
    key            = "DeFi4DevOps/badger-example/main.tfstate" ## you can change this too if you want, but only once before you start
    dynamodb_table = "tfstate-locking"
  }
}
