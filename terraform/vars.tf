variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "STAGE" {
  description = "Stage name you want to append to all infrastructure."
}

variable "LAMBDA_RUNTIME" {
  default = "nodejs12.x"
}