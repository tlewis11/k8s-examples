!/bin/bash

#pushd manifests/vpc
#terraform init
#terraform apply --auto-approve
#popd

pushd manifests/eks
terraform init
#terraform destroy
terraform apply --auto-approve
cp kubeconfig_tlewis11 ~/.kube/config
popd

#./deploy_application.sh