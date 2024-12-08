resource "aws_eks_access_policy_association" "eks-policy" {
  cluster_name  = aws_eks_cluster.eks-cluster.name
  policy_arn    = var.policyArn
  principal_arn = "arn:aws:iam::276287347983:role/LabRole"

  access_scope {
    type = "cluster"
  }
}