resource "aws_eks_cluster" "eks-cluster" {
  name     = "Cluster-${var.project_name}"
  role_arn = data.aws_iam_role.lab_role.arn

  vpc_config {
    subnet_ids         = ["${data.aws_subnet.subnet_a.id}", "${data.aws_subnet.subnet_b.id}", "${data.aws_subnet.subnet_c.id}"]
    security_group_ids = [data.aws_security_group.default.id]
  }

  access_config {
    authentication_mode = var.access_config
  }
}
