# Terraform EKS AWS Academy

This project deploy an EKS cluster in AWS Academy account using terraform and github actions for academic proposes.

## Update terraform credentials

Write an `academy` profile into the `~/.aws/credentials` file

```sh
# ~/.aws/credentials
[academy]
aws_access_key_id="your_aws_access_key_id"
aws_secret_access_key="your_aws_secret_access_key"
aws_session_token="your_aws_session_token"
```

## GitHub Actions

Add secrets to your github repository at `settings` > `actions` > `secrets`

- `AWS_SECRET_ACCESS_KEY`
- `AWS_ACCESS_KEY_ID`
- `AWS_SESSION_TOKEN` _It's not possible to use oidc with aws academy labs_
- `AWS_REGION`

## Terraform

1. **Go into backend directory**:

```sh
cd infrastructure/backend
```

2. **Init Terraform**:

```sh
terraform init
```

3. **Check plan**:

```sh
terraform plan
```

4. **Apply plan**:

```sh
terraform apply --auto-approve
```

5. **Go into environments/dev directory**:

```sh
cd infrastructure/environments/dev
```

and repeat the steps from **2** to **4**

## Sample Apps

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

### Nginx example

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

- **Deploy auto scaler**:

```sh
kubectl apply -f apps/sample/auto-scaler.yml
```

- **Get autoscaler**:

```sh
kubectl get pods -n kube-system
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

- **Delete auto scaler**:

```sh
kubectl delete -f apps/sample/auto-scaler.yml -n kube-system
```

## Resources

- [EKS Cluster Using Terraform + IAM Roles for Service Accounts & EKS Cluster Autoscaler](https://www.youtube.com/watch?v=MZyrxzb7yAU)
- [Deploy to AWS with Terraform within a GitHub Action](https://www.youtube.com/watch?v=GowFk_5Rx_I&t=195s)
