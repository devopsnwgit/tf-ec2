resource "aws_instance" "terraform-instance" {
  ami             = var.image_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.terraform-key.key_name
  security_groups = ["${aws_security_group.allow_ports.name}"]

  tags = {
    Name = "Terraform-generated-instance"
  }

  user_data = <<EOF
#!/bin/bash
sudo yum install -y httpd
sudo echo "Hello World!" > /var/www/html/index.html
sudo systemctl start httpd
EOF

}
