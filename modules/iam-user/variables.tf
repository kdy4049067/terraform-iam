variable "name" {
    description = "IAM user name"
    type = string
}

variable "tags" {
    description = "Tags to apply to the user"
    type = map(string)
    default = {}
}
