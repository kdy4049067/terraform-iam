resource "aws_iam_user" "this" {
    name = var.name
    tags = var.tags
}