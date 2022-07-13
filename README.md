# Terraform module: deploy your infrastructure in a click

Scaleway's products can be used and deployed through Terraform.
The purpose of this guide is to help users deploy their infrastructure in a safe and quick way, thanks to a module provided by Scaleway team.
With this module you will be able to deploy an instance inside a private network, a load balancer, a database, a kapsule cluster, and vpc products: public gateway (DHCP/NAT/SSH Bastion) + private network.


## Architecture Schema

![Alt text](Terraform_Module_Scaleway_Schema.png?raw=true "Title")

## Pre-requisites

Before starting on the project, you need to have an [account](https://www.scaleway.com/en/docs/console/my-account/how-to/create-an-account/), your [credentials](https://www.scaleway.com/en/docs/console/my-account/concepts/#api-key) all set up, and [install Terraform ](https://learn.hashicorp.com/tutorials/terraform/install-cli) on the server you are using, or locally, using  the last version of the Scaleway Terraform [provider](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs).


## The workflow

1. Clone or fork this repository (if you want to add changes)
2. Set up the right ``bucket`` and the right ``key`` in your `backend.tf`
3. Choose your root and db's password `rdb_user_root_password` and `rdb_user_scaleway_db_password`
4. Deploy your Scaleway infrastructure through Terraform
```
terraform init
terraform plan
terraform apply
```

### Reminder

Don't forget, you will neeed aws credentials for the accessing your S3 bucket (do not worry, the bucket is at Scaleway ;) ).
==> Create a ``~/.aws/credentials``:
```
[default]
aws_access_key_id=<SCW_ACCESS_KEY>
aws_secret_access_key=<SCW_SECRET_KEY>
region=fr-par
```


## Resources

You can find different resources here:
- Starting with terraform: [how to init your infrastructure](https://blog.scaleway.com/terraform-how-to-init-your-infrastructure/)
- The blog article related to this repository: [Terraform module: deploy your infrastructure in a click]()
---