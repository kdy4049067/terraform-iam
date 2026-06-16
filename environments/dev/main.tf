module "iam_user_daeyeon" {
    source = "../../modules/iam-user"

    name = "daeyeon"
    tags = {
        environment = "dev"
        project = "terraform-iam"
    }
}
