  terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.70.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region="us-east-2"
}

resource "aws_instance" "Test_Instance" {
  ami           = data.aws_ami.EC2_ami.id
  instance_type = "t2.micro"
  tags = {
    Name = "Test"
    env = "Prod"
  }
}
