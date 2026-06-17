resource "aws_security_group" "this" {
    name        = var.name
    description = var.description
    vpc_id      = var.vpc_id

    tags = merge(var.tags, {
        Name = var.name
    })
}

resource "aws_vpc_security_group_ingress_rule" "this" {
    for_each = { for rule in var.ingress_rules : "${rule.from_port}-${rule.protocol}" => rule }

    security_group_id = aws_security_group.this.id
    ip_protocol       = each.value.protocol
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    cidr_ipv4         = each.value.cidr
    description       = lookup(each.value, "description", null)
}

resource "aws_vpc_security_group_egress_rule" "allow_all" {
    security_group_id = aws_security_group.this.id
    ip_protocol       = "-1"
    cidr_ipv4         = "0.0.0.0/0"
}
