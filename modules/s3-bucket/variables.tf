variable "bucket_name" {
    description = "S3 bucket name"
    type        = string
}

variable "versioning_enabled" {
    description = "Enable versioning on the bucket"
    type        = bool
    default     = false
}

variable "block_public_access" {
    description = "Block all public access to the bucket"
    type        = bool
    default     = true
}

variable "tags" {
    description = "Tags to apply to the bucket"
    type        = map(string)
    default     = {}
}
