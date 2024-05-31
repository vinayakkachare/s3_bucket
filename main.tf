#create s3 bucket

resource "aws_s3_bucket" "mubucket" {
  bucket = var.bucketname
}
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mubucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mubucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.mubucket.id
  acl    = "public-read"
}
