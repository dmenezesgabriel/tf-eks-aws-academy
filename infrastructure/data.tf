data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

data "aws_caller_identity" "current" {}

data "aws_vpc" "main_vpc" {}

data "aws_subnet" "subnet_a" {
  vpc_id            = data.aws_vpc.main_vpc.id
  availability_zone = "us-east-1a"
}

data "aws_subnet" "subnet_b" {
  vpc_id            = data.aws_vpc.main_vpc.id
  availability_zone = "us-east-1b"
}

data "aws_subnet" "subnet_c" {
  vpc_id            = data.aws_vpc.main_vpc.id
  availability_zone = "us-east-1c"
}

data "aws_security_group" "default" {
  name = "default"
}

# data "aws_instance" "ec2" {
#   filter {
#     name   = "tag:eks:nodegroup-name"
#     values = ["${aws_eks_node_group.node.node_group_name}"]
#   }
# }
