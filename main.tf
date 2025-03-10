terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "maroonvillage-hcp-organization"
    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
        name = "pdfdocintel-webui-aws"
    }
 }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "react_app" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "react-app-server"
  }
}

output "public_ip" {
  value = aws_instance.react_app.public_ip
}