resource "aws_elastic_beanstalk_application" "beanstalk_app" {
  name = "${var.beanstalk_app}-${var.env}"
}

output "beanstalk_app" {
  value = aws_elastic_beanstalk_application.beanstalk_app
}

resource "aws_elastic_beanstalk_application_version" "application_version" {
  name        = "${var.beanstalk_app}-${var.env}-version"
  application = aws_elastic_beanstalk_application.beanstalk_app.name
  bucket      = aws_s3_bucket.s3_bucket_source.id
  key         = aws_s3_object.s3_object_source.id

  depends_on = [
    aws_elastic_beanstalk_application.beanstalk_app,
    aws_s3_bucket.s3_bucket_source,
    aws_s3_object.s3_object_source
  ]
}

output "application_version" {
  value = aws_elastic_beanstalk_application_version.application_version
}
