provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "open_sg" {
  name        = "open-sg"
  description = "Overly permissive SG"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "bad_bucket" {
  bucket = "stk-insecure-bucket-example"
  acl    = "public-read"
  versioning {
    enabled = false
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
