variable "name" {
    description = "Security group name"
    type        = string
}

variable "description" {
    description = "Security group description"
    type        = string
    default     = "Managed by Terraform"
}

variable "vpc_id" {
    description = "VPC ID to create the security group in"
    type        = string
}

variable "ingress_rules" {
    description = "List of ingress rules"
    type = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr        = string
        description = optional(string)
    }))
    default = []
}

variable "tags" {
    description = "Tags to apply to the security group"
    type        = map(string)
    default     = {}
}
