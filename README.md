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

- **get nodes**:

```sh
kubectl get nodes
```

```sh
kubectl create namespace eks-sample-app
```

### hello example

- **Deploy pod to cluster**:

```sh
kubectl apply -f apps/sample/hello.yml
```

- **Get Pods**:

```sh
kubectl get pods -n eks-sample-app
```

- **Run container command**:

```sh
kubectl exec aws-cli -n eks-sample-app -- aws s3api list-buckets
```

- **Delete Pod**:

```sh
kubectl delete -f apps/sample/hello.yml -n eks-sample-app

```

### Create application

- **Deploy deployment to cluster**:

```sh
kubectl apply -f apps/sample/deployment.yml -n eks-sample-app
```

- **Deploy public load balancer to cluster**:

```sh
kubectl apply -f apps/sample/public-lb.yml -n eks-sample-app
```

- **Deploy private load balancer to cluster**:

```sh
kubectl apply -f apps/sample/private-lb.yml -n eks-sample-app
```

- **Get all pods**:

```sh
kubectl get all -n eks-sample-app
```

- **Get services**:

```sh
kubectl get svc -n eks-sample-app
```

- **Get Logs**:

```sh
kubectl logs -n eks-sample-app pod/eks-sample-linux-deployment-66cfbc47b7-v98lc
```

- **Delete deployment**:

```sh
kubectl delete -f apps/sample/deployment.yml -n eks-sample-app
```

- **Delete public load balancer**:

```sh
kubectl delete -f apps/sample/public-lb.yml -n eks-sample-app
```

- **Delete private load balancer**:

```sh
kubectl delete -f apps/sample/private-lb.yml -n eks-sample-app
```

## Resources

- [EKS Cluster Using Terraform + IAM Roles for Service Accounts & EKS Cluster Autoscaler](https://www.youtube.com/watch?v=MZyrxzb7yAU)
