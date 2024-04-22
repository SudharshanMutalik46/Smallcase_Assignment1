provider "aws" {
  region = "us-east-1"
}


resource "aws_ebs_volume" "encrypted_volume" {
  availability_zone = "us-east-1a"
  size              = 10
  encrypted         = true
  kms_key_id        = "arn:aws:kms:us-east-1:371269593399:key/89b4ecea-7da1-49c4-afe7-75ae04edfe71" 
}

resource "aws_instance" "example" {
  ami                    = "ami-080e1f13689e07408"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  associate_public_ip_address = true
  key_name               = "Key" 

  tags = {
    Name = "Demo"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/sdf" 
  volume_id   = aws_ebs_volume.encrypted_volume.id
  instance_id = aws_instance.example.id
}
