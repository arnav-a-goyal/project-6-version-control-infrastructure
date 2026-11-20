
# Project 4 - IAM User Automation with Terraform

## Objective
Create an IAM user with controlled S3 read-only permissions.

## Tools
- AWS IAM
- Amazon S3
- Terraform
- AWS CLI
- VS Code

## Resources Created
1. IAM User
2. Custom IAM Policy
3. IAM Policy Attachment

## Permissions
- s3:ListBucket
- s3:GetObject

Upload and delete permissions are not granted.

## Execution
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply


## Testing Results and Limitations

- IAM user successfully created using Terraform.
- Custom S3 read-only policy successfully created.
- Policy attached to the IAM user.
- Policy JSON verified using AWS CLI.
- S3 ListBucket and GetObject permissions are included.

Note:
The IAM Policy Simulator reports
AllowedByOrganizations: false due to
company AWS Organizations restrictions.

Effective S3 access requires validation
by the AWS account administrator.
