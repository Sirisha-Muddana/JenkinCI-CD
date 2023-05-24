module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "Terraform1-task"
  instance_type          = "t2.micro"
  key_name               = "cicd"

  tags = {
   Terraform   = "true"
   Environment = "dev"
 }
}
