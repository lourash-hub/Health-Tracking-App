variable "availability_zones" {
  description = "List of availability zones"
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
}
