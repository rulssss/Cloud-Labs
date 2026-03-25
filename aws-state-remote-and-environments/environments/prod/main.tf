terraform {
    backend "s3" {
        bucket = "rulss-terraform-state"
        key = "prod/terraform.tfstate"
        region = "sa-east-1"
        dynamodb_table = "terraform-lock"
    }
}

module "network" {
    source = "../../"
    
    project = "rulss"
    environment = "prod"
}