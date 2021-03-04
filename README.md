# tf-s3-module
Terraform S3 Module 

## Pre-requisites
- Terraform installed : 0.13.0
- git

## Defaults
- AWS credentials file : $HOME/.aws/credentials
- AWS Profile name : default
- AWS Regions : us-west-2/eu-west-1

## Steps
#### 1. Clone this repository
```
git clone https://github.com/taherbohari/tf-s3-module.git
```
#### 2. cd into directory
```
cd ./tf-s3-module/hourly
```
#### 3. initialize terraform
```
terraform init
```
eg :
```
root@455d198a75e8:/tmp/tf-s3-module/daily# terraform init
Initializing modules...

Initializing the backend...

Initializing provider plugins...
- Using previously-installed hashicorp/aws v3.30.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
**NOTE :** In case you need to change the values like bucket prefix, Please update hourly.tfvars file before running below commands.
#### 4. terraform plan
```
terraform plan -var-file hourly.tfvars
```
#### 5. terraform apply
```
terraform apply -var-file hourly.tfvars
```
#### 6. Repeat steps 2 to 5 for daily and weekly buckets
#### 7. Ways to pass variables to terraform module
- Using .tfvars file (as seen above)
```
cd ./tf-s3-module/hourly
terraform init
terraform plan -var-file hourly.tfvars
terraform apply -var-file hourly.tfvars
terraform destroy -var-file hourly.tfvars
```
- From command line
```
cd ./tf-s3-module/daily
terraform init
terraform plan -var 'prefix=crazy-berlin'
terraform apply -var 'prefix=crazy-berlin'
terraform destroy -var 'prefix=crazy-berlin'
```
```
root@455d198a75e8:/tmp/tf-s3-module/daily# terraform plan -var 'prefix=crazy-berlin'
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.s3-bucket.aws_s3_bucket.friday[0] will be created
  + resource "aws_s3_bucket" "friday" {
      + acceleration_status         = "Suspended"
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "crazy-berlin-daily"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = "BucketOwner"
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

  # module.s3-bucket.aws_s3_bucket_public_access_block.friday[0] will be created
  + resource "aws_s3_bucket_public_access_block" "friday" {
      + block_public_acls       = false
      + block_public_policy     = false
      + bucket                  = (known after apply)
      + id                      = (known after apply)
      + ignore_public_acls      = false
      + restrict_public_buckets = false
    }

Plan: 2 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```
```
root@455d198a75e8:/tmp/tf-s3-module/daily# terraform apply -var 'prefix=crazy-berlin'

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
...
...
... Truncated Output
Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.s3-bucket.aws_s3_bucket.friday[0]: Creating...
module.s3-bucket.aws_s3_bucket.friday[0]: Still creating... [10s elapsed]
module.s3-bucket.aws_s3_bucket.friday[0]: Creation complete after 12s [id=crazy-berlin-daily]
module.s3-bucket.aws_s3_bucket_public_access_block.friday[0]: Creating...
module.s3-bucket.aws_s3_bucket_public_access_block.friday[0]: Creation complete after 1s [id=crazy-berlin-daily]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
- At run time
