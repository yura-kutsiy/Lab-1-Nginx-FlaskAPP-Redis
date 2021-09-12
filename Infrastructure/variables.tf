#---var---main---
variable "region" {
  description = "Region where create Infrastructure"
  default     = "eu-central-1"
}
variable "instance_type" {
  description = "Instance type for all servers"
  default     = "t2.micro"
}
variable "pair_key" {
  description = "AWS pair key for all instances"
  default     = "aws-key-Frankfurt"
}
#---var-networking---

#---var---security-group-nginx---
# variable "ports_nginx" {
#description = "Allow ports for Nginx security group"
#   default = ["80", "22", "5000"]
# }
#---var---security-group-redis---
# variable "ports_redis" {
#description = "Allow ports for Redis security group"
#   default = ["6379", "22"]
# }
#---var---default--
variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
  default = {
    Owner       = "Quake"
    Project     = "Lab-1"
    Environment = "dev"
  }
}
