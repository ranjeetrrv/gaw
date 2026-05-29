data "terraform_remote_state" "vpc" {
  for_each = toset(concat(var.workspaces, [terraform.workspace]))
  backend  = "s3"
  config = {
    bucket = "wakatech-state-files"
    key    = "infra-provisioners/vpc.tfstate"
    region = "us-west-2"
  }
  workspace = each.key
}