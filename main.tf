# Specify the provider and access details
provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "example_vm" {
  ami = var.ami
  instance_type = var.instance_type
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,user_data, user_data_replace_on_change
    ]
  }
}
