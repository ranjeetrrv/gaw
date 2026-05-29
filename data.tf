data "terraform_remote_state" "vpc" {
  count   = local.environment != "admin" ? 1 : 0
  backend = "s3"
  config = {
    bucket = "wakatech-state-files"
    key    = "infra-provisioners/vpc.tfstate"
    region = "us-west-2"
  }
  workspace = "admin"
}