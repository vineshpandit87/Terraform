provider "aws" {
    region= "us-east-1"
}

resource "aws_instance" "db" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"

}
resource "aws_instance" "web" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
  depends_on = [aws_instance.db]

}
