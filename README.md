# EKS Cluster

## Update terraform credentials

```sh
~/.aws/credentials
```

## Terraform

terraform init
terraform fmt
terraform plan
terraform apply
terraform destroy

## Apps

- **Set cluster connection config**:

```sh
aws eks update-kubeconfig --name cluster-postech-challenge-3  --region us-east-1 --profile academy
```

```sh
kubectl get nodes
```

- **hello**:

```sh
kubectl apply -f apps/sample/hello.yml
```

```sh
kubectl get pods -n eks-sample-app
```

```sh
kubectl exec aws-cli -n eks-sample-app -- aws s3api list-buckets
```

```sh
kubectl delete -f apps/sample/hello.yml -n eks-sample-app

```

- **Create application**:

```sh
kubectl create namespace eks-sample-app
```

```sh
kubectl apply -f apps/sample/deployment.yml -n eks-sample-app
```

```sh
kubectl apply -f apps/sample/service.yml -n eks-sample-app
```

```sh
kubectl get all -n eks-sample-app
```

```sh
kubectl logs -n eks-sample-app pod/eks-sample-linux-deployment-66cfbc47b7-v98lc
```

```sh
kubectl delete -f apps/sample/deployment.yml -n eks-sample-app
```

```sh
kubectl delete -f apps/sample/service.yml -n eks-sample-app
```

## Resources

- [EKS Cluster Using Terraform + IAM Roles for Service Accounts & EKS Cluster Autoscaler](https://www.youtube.com/watch?v=MZyrxzb7yAU)
