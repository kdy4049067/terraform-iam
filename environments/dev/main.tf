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

# module "ec2_dev" {
#     source = "../../modules/ec2-instance"
#
#     name          = "dev-server"
#     ami_id        = "ami-xxxxxxxxxxxxxxxxx"  # ap-northeast-2 Amazon Linux 2023 AMI
#     instance_type = "t3.micro"
#     tags = {
#         environment = "dev"
#         project     = "terraform-iam"
#     }
# }
