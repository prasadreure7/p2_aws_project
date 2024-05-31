variable "aws_region" {
  default     = "us-east-1"
  description = "value of the region where the resources will be created"

}

variable "bucketname" {
  description = "This is the name of the bucket"
  default     = "revhire-tf-bucket"

}

variable "website_index_document" {
  description = "This is the name of the index document"
  default     = "index.html"

}

variable "rds_username" {
  description = "This is the username for the RDS instance"
  default     = "Admin"
  
}

variable "rds_password" {
  description = "This is the password for the RDS instance"
  default     = "Admin1234"
  
}