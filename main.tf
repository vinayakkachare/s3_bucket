#create s3 bucket

resource "aws_s3_bucket" "mubucket" {
  bucket = var.bucketname
}
