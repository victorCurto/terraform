resource "aws_s3_bucket" "bucket" {
  count = 1 //count property and index
  #bucket = "2022010145-app-image-bucket-${count.index}"
  bucket = var.bucket_name
}
