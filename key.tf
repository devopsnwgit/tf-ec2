resource "aws_key_pair" "terraform-key" {
  key_name   = "tf-generated-key"
  public_key = file("${path.module}/id_rsa.pub")

}
