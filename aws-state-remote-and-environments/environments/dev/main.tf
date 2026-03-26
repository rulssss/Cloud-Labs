terraform {
    backend "s3" {
        bucket = "rulss-terraform-state"
        key = "dev/terraform.tfstate"
        region = "sa-east-1"
        dynamodb_table = "terraform-lock"
    }
}
#cambio prueba workflow 
module "network" {
    source = "../../"

    project = "rulss"
    environment = "dev"
}
