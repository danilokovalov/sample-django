resource "aws_s3_bucket" "ansible_ssm_bucket" {
  bucket = "my-ansible-ssm-bucket-unique-name-12345"

  tags = {
    Name        = "Ansible SSM bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket                  = aws_s3_bucket.ansible_ssm_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "ssm_access_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.ssm_role.arn]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.ansible_ssm_bucket.arn,
      "${aws_s3_bucket.ansible_ssm_bucket.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.ansible_ssm_bucket.id
  policy = data.aws_iam_policy_document.ssm_access_policy.json
}

