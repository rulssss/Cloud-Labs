terraform {
    backend "s3" {
        bucket = "rulss-terraform-state"
        key = "dev/terraform.tfstate"
        region = "sa-east-1"
        dynamodb_table = "terraform-lock"
    }
}
#comentario en dev
module "network" {
    source = "../../"

    project = "rulss"
    environment = "dev"
}
