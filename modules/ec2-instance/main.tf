resource "aws_instance" "this" {
    ami                    = var.ami_id
    instance_type          = var.instance_type
    key_name               = var.key_name
    subnet_id              = var.subnet_id
    vpc_security_group_ids = length(var.security_group_ids) > 0 ? var.security_group_ids : null

    tags = merge(var.tags, {
        Name = var.name
    })
}
