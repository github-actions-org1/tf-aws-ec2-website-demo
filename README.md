# terraform-aws-ec2

# GitLab CI/CD

GitLab CI/CD is the part of GitLab that you use for all of the continuous methods (Continuous Integration, Delivery, and Deployment). With GitLab CI/CD, you can test, build, and publish your code with no third-party application or integration needed.

## Getting started
Clone or push an existing Git repository with the following command:

```
git clone https://github.com/cicd-github-action/tf-aws-ec2-web.git
git add -A 
git push origin main
```
### Prerequisites for creating instance 

Overview
_________________________________________________
1. Deploying S3 and DynamoDB infrastructure
1. Create Key Pair
1. Create EC2 Instance 
1. Add a tag to your instance
1. Connect to your instance
1. Describe your instance
1. Terminate your instance

Initialize your terraform configuration file. To do that; execute:
```
$ terraform init
$ terraform fmt 
$ terraform validate 
$ terraform plan
$ terraform apply -auto-approve
```
