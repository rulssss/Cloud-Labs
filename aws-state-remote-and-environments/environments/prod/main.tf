terraform {
    backend "s3" {
        bucket = "rulss-terraform-state"
        key = "prod/terraform.tfstate"
        region = "sa-east-1"
        dynamodb_table = "terraform-lock"
    }
}
#test de rama
module "network" {
    source = "../../"
    
    project = "rulss"
    environment = "prod"
}