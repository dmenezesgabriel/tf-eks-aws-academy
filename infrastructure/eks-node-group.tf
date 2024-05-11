resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "node-group-${var.project_name}"
  node_role_arn   = data.aws_iam_role.lab_role.arn
  subnet_ids      = ["${data.aws_subnet.subnet_a.id}", "${data.aws_subnet.subnet_b.id}", "${data.aws_subnet.subnet_c.id}"]
  instance_types  = ["${var.instance_type}"]
  disk_size       = 50

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}
