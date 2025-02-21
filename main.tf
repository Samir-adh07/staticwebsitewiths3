resource "aws_s3_bucket" "mybucket" {

    bucket = var.bucketname
  
}

resource "aws_s3_bucket_ownership_controls" "example" {

    bucket = aws_s3_bucket.mybucket.id
    rule{
        object_ownership = "BucketOwnerPreferred"
    }
  
}

resource "aws_s3_bucket_public_access_block" "example" {

    bucket = aws_s3_bucket.mybucket.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
  
}
resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = "terrraformprojectnewsamir"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "arn:aws:s3:::terrraformprojectnewsamir/*"
    }]
  })
}



resource "aws_s3_object" "index" {

    bucket = aws_s3_bucket.mybucket.id
    key = "index.html"
    source = "index.html"
    content_type = "text/html"
  
}


resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.mybucket.id
    key = "error.html"
    source = "error.html"
    content_type = "text/html"
  
}


resource "aws_s3_object" "image" {

    bucket = aws_s3_bucket.mybucket.id
    key ="image"
    source = "project1.jpg"
  
  
}

resource "aws_s3_bucket_website_configuration" "website" {

    bucket = aws_s3_bucket.mybucket.id
    index_document {
      suffix = "index.html"
    }

    error_document {
      key = "error.html"


    }

  
}
