This project creates a simple 3 tier architecture. The AWS services created as a part of this are:

1. VPC
2. Subnets
    1. app
    2. web
    3. db
    4. public
3. IGW
4. NAT
5. Route Table (& Routes and Route Table associations)
6. Security Group for TLS access
7. Webserver
8. ALB

This terraform project uses modules and those can be found in the modules folder
The tags.yml file is used to define the tags that will be used applied to the terraform components created
The sg-rules.yml file is used to define the rules that will created inside the security group

The variables.tf file has the definition of the variables and desccription of the variables
The values of the variables can be defined in the variables.tf file itself or in the values.tfvars file

backend.tf file will contain the information about the backend in case the terraform backend will need to remote instead of local

When the values are appropriately filled, the following commands will need to be executed in the 3-tier-architecture folder:

```bash
terraform init # to initalize terraform
terraform plan # to check all the services that will be created using terraform
terraform apply --var-file="values.tfvars" # to create the services in the AWS account
```

