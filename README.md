# k8s-examples

# Deploy EKS Farage cluster
1. Create VPC and subnets

```
cd fargate-eks-cluster/manifests/vpc
terraform apply
```

2. Deploy EKS cluster with Fargate Nodes


View the eks-vpc-stack Cloudformation stack.  Copy values of the VpcId and SubnetIds stack outputs. 
update the vpc_id and subnets to use for EKS cluster in eks.tf: 
https://github.com/tlewis11/k8s-examples/blob/main/fargate-eks-cluster/manifests/eks/eks.tf#L5-L6 

```
cd fargate-eks-cluster/manifests/vpc
terraform apply
```



