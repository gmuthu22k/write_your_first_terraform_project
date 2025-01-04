terraform {
  backend "s3" {
    bucket         = "211125478125-terraform-states"
    key            = "some_environment/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}

