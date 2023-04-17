data "archive_file" "lambda_archive" {
  type        = "zip"
  source_dir  = "${path.module}/../lambda_src"
  output_path = "lambda_src.zip"
}

resource "aws_lambda_function" "function" {
  filename         = data.archive_file.lambda_archive.output_path
  function_name    = "${var.STAGE}-where-am-i-lambda"
  handler          = "index.handler"
  role             = aws_iam_role.lambda-role.arn
  runtime          = var.LAMBDA_RUNTIME
  source_code_hash = base64sha256(filebase64(data.archive_file.lambda_archive.output_path))
  publish          = true
}

resource "aws_iam_role" "lambda-role" {
  name               = "${var.STAGE}-where-am-i-lambda-role"
  assume_role_policy = file("${path.module}/iam_docs/lambda-role.json")
}

resource "aws_iam_role_policy" "lambda-role-policy" {
  name = "${var.STAGE}-where-am-i-lambda-role-policy"
  role = aws_iam_role.lambda-role.id

  policy = file("${path.module}/iam_docs/lambda-policy.json")
}