variable "name" {
    description = "VPC name (used as Name tag prefix)"
    type        = string
}

variable "cidr_block" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "172.16.0.0/16"
}

variable "public_subnet_cidrs" {
    description = "List of CIDR blocks for public subnets"
    type        = list(string)
    default     = ["172.16.1.0/24", "172.16.2.0/24"]
}

variable "availability_zones" {
    description = "List of availability zones for subnets"
    type        = list(string)
    default     = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "tags" {
    description = "Tags to apply to all resources"
    type        = map(string)
    default     = {}
}
