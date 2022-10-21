resource "aws_vpc" "new_vpc" {
  cidr_block = "172.20.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "172.20.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-example"
  }
}



