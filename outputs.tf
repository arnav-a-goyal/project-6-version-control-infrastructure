
output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "iam_user_name" {
  value = aws_iam_user.s3_reader.name
}

output "iam_user_arn" {
  value = aws_iam_user.s3_reader.arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.s3_read_only.arn
}
