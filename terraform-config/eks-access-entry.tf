resource "aws_eks_access_entry" "access-entry" {
  cluster_name      = aws_eks_cluster.eks-cluster.name
  principal_arn     = "arn:aws:iam::276287347983:role/LabRole"
  kubernetes_groups = ["fiap", "grupo"]
  type              = "STANDARD"
}