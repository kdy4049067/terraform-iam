module "iam_user_daeyeon" {
    source = "../../modules/iam-user"

    name = "daeyeon"
    tags = {
        environment = "dev"
        project     = "terraform-iam"
    }
}

module "s3_bucket_dev" {
    source = "../../modules/s3-bucket"

    bucket_name         = "terraform-iam-dev-bucket"
    versioning_enabled  = true
    block_public_access = true
    tags = {
        environment = "dev"
        project     = "terraform-iam"
    }
}

module "vpc_dev" {
    source = "../../modules/vpc"

    name                = "dev-vpc"
    cidr_block          = "172.16.0.0/16"
    public_subnet_cidrs = ["172.16.1.0/24", "172.16.2.0/24"]
    availability_zones  = ["ap-northeast-2a", "ap-northeast-2c"]
    tags = {
        environment = "dev"
        project     = "terraform-iam"
    }
}

module "sg_dev" {
    source = "../../modules/security-group"

    name   = "dev-sg"
    vpc_id = module.vpc_dev.vpc_id
    ingress_rules = [
        {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr        = "0.0.0.0/0"
            description = "SSH"
        },
        {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr        = "0.0.0.0/0"
            description = "HTTP"
        }
    ]
    tags = {
        environment = "dev"
        project     = "terraform-iam"
    }
}

module "ec2_dev" {
    source = "../../modules/ec2-instance"

    name               = "dev-server"
    ami_id             = "ami-05d2438ca66594916"  # ap-northeast-2 Amazon Linux 2023
    instance_type      = "t3.micro"
    subnet_id          = module.vpc_dev.public_subnet_ids[0]
    security_group_ids = [module.sg_dev.security_group_id]
    tags = {
        environment = "dev"
        project     = "terraform-iam"
    }
}
