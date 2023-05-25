variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "175.16.0.0/16"
}

variable "availability_zone" {
  description = "availability_zone"
  type        = string
  default     = "ap-south-1a"
}

variable "ami" {
  description = "ami"
  type        = string
  default     = "ami-0889a44b331db0194"
}

variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "t2.micro"
}

variable "bucket" {
  description = "he name of the bucket"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

# variable "master_username" {
#   description = "master_username"
#   type        = string
#   default     = "admin"
# }

# variable "master_password" {
#   description = "master_password"
#   type        = string
#   default     = "Testing1"
# }

variable "region" {
  description = "region"
  type        = string
  default     = "ap-south-1"
}
