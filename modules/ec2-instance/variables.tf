variable "name" {
    description = "EC2 instance name (used as Name tag)"
    type        = string
}

variable "ami_id" {
    description = "AMI ID to use for the instance"
    type        = string
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t3.micro"
}

variable "key_name" {
    description = "Key pair name for SSH access"
    type        = string
    default     = null
}

variable "subnet_id" {
    description = "Subnet ID to launch the instance in"
    type        = string
    default     = null
}

variable "security_group_ids" {
    description = "List of security group IDs to attach"
    type        = list(string)
    default     = []
}

variable "tags" {
    description = "Tags to apply to the instance"
    type        = map(string)
    default     = {}
}
