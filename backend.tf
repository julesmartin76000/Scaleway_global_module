# Storing terraform state in the cloud
terraform {
  backend "s3" {
    bucket                      = "XXXXXXXX"
    key                         = "terraform_module.tfstate"
    region                      = "fr-par"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}


/*

For the credentials part:

==> Create a ~/.aws/credentials:

[default]
aws_access_key_id=<SCW_ACCESS_KEY>
aws_secret_access_key=<SCW_SECRET_KEY>
region=fr-par

*/
