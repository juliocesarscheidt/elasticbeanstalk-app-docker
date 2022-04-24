resource "aws_s3_bucket" "s3_bucket_source" {
  bucket = "elasticbeanstalk-${var.aws_region}-${local.account_id}-${var.env}"
}

resource "aws_s3_object" "s3_object_source" {
  bucket = aws_s3_bucket.s3_bucket_source.id
  key    = "beanstalk/application.zip"
  source = "application.zip"
}
