terraform {
    backend "s3" {
        bucket         = "terraform-state-217615693372"
        key            = "iam/terraform.tfstate"
        region         = "ap-northeast-2"
        dynamodb_table = "terraform-state-lock"
        encrypt        = true
    }
 }