
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "default"
}

variable "iam_user_name" {
  description = "IAM username"
  type        = string
  default     = "arnav-project4-s3-reader"
}

variable "iam_policy_name" {
  description = "IAM policy name"
  type        = string
  default     = "arnav-Project4S3ReadOnlyPolicy"
}

# S3 policy stored as a variable
variable "s3_read_policy" {
  description = "S3 read-only permissions"

  type = object({
    Version = string

    Statement = list(object({
      Sid      = string
      Effect   = string
      Action   = list(string)
      Resource = list(string)
    }))
  })

  default = {
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "ListBucket"
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = [
          "arn:aws:s3:::project2-static-site-5574175f"
        ]
      },
      {
        Sid    = "ReadObjects"
        Effect = "Allow"

        Action = [
          "s3:GetObject"
        ]

        Resource = [
          "arn:aws:s3:::project2-static-site-5574175f/*"
        ]
      }
    ]
  }
}
