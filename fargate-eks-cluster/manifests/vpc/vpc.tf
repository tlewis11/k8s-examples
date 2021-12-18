
data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

data "aws_cloudformation_stack" "vpc_stack" {
  name = "eks-vpc-stack"
}

data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"

  cluster_version = "1.21"
  cluster_name    = "game-server-cluster"
  vpc_id          = "vpc-06bd981acdf355919" #var.vpc_id
  subnets         = ["subnet-02b4f34e92b8dce02","subnet-0d992be9d3f74315b","subnet-0e2b4a13d2e2f155f","subnet-0d469d32fdbeb5d8d"] #var.subnets 

  worker_groups = [
    {
      instance_type = "m4.large"
      asg_max_size  = 5
    }
  ]
}