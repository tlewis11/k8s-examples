resource "aws_cloudformation_stack" "vpc_stack" {
  name = "eks-vpc-stack"
  template_url = "https://amazon-eks.s3.us-west-2.amazonaws.com/cloudformation/2020-10-29/amazon-eks-vpc-private-subnets.yaml"
}
