# Pre-requisites:
- Terraform version 1.2.9 installed
- Create a terraform.tfvars file and add required variables as below
```
public_key = "ssh-....xxxxfjrdsfd xcfg@gmail.com"
```
- You can add optional variables as below in ec2-module section in main.tf file
```yaml
module "ec2" {
  source      = "./modules/ec2"
  public_key  = var.public_key
  ami_id      = "xxxxx"
  policy_name = "xxxxx"
}
```

# Procedure to the run the code locally:
```shell
terraform init
terraform validate
terraform plan -out plan.json
terraform apply plan.json
```

## Optional Variables to customize:
- ami_id
- policy_name
- sg_name
- key_name
- policy_attachment_name
- instance_profile_name

## Required Variables to pass:
- public_key