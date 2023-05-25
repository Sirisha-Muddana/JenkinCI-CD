module "vpc" {
  source = "./module/vpc"

  name              = "sirisha"
  region = var.region
  availability_zone = var.availability_zone
}

provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "east"
  region = var.region
}