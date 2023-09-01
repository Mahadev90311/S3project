

resource "aws_s3_bucket" "samplebuc2023" {
  bucket = var.bucketname112345


  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_ownership_controls" "name" {
  bucket = aws_s3_bucket.samplebuc2023.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }


}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.samplebuc2023.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.samplebuc2023.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"

}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.samplebuc2023.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"

}
resource "aws_s3_object" "profile" {
  bucket       = aws_s3_bucket.samplebuc2023.id
  key          = "profile.png"
  source       = "profile.png"
  acl          = "public-read"
  content_type = ""
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.samplebuc2023.id
  index_document {
    suffix = "index.html"

  }
  error_document {
    key = "error.html"
  }
}


