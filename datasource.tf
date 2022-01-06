data "aws_ami" "EC2_ami" {
  owners           = ["amazon"]
  most_recent      = true
  
  

  filter {
    name   = "name"
    values = ["amzn2-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }


}