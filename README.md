# Where Am I AWS Lambda
A simple NodeJS project which will deploy an AWS lambda returning it's current deployment region. This will be deplpoyed using Terraform.

## Getting started
To deploy your lambda there's a few things you need to do:
1. Populate the `./terraform/terraform.tfvars` file with the STATGE you want to append to all infrastructure created
2. In the `./terraform/backend.tfvars` you will want to populate information on your aws S3 remote state. For more information on remote state and to create one see [kami950/terraform-remote-state](https://github.com/kami950/terraform-remote-state)
3. Following this you are ready to deploy your lambda by running the `deployLambda.sh` script
4. If you want to destroy lambda and the created resources then you can use the `destroyLambda.sh` script

## Technical information 
This project will provision the following:
* An AWS Lambda with the following naming convention: {STAGE}-where-am-i-lambda
* A Lambda role with the following name: {STAGE}-where-am-i-lambda-role
* A Lambda policy with the following name: {STAGE}-where-am-i-lambda-role-policy

You are able to delete these in the AWS console if there's any issues with the created remote state.
