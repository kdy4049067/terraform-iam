variable "aws_region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "ap-northeast-2"
}

variable "environment" {
    description = "Environment name (dev, prod)"
    type        = string
    default     = "dev"
}

variable "project_name" {
    description = "Project name used for resource naming"
    type        = string
    default     = "terraform-iam"
}