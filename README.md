# EKS Cluster

## Atualizar credenciais da AWS

```sh
vi ~/.aws/credentials
```

_Ir até a parte que deseja deletar abaixo_
`dd`
_Colocar novas credenciais_

## Terraform

terraform init
terraform fmt
terraform plan
terraform apply
terraform destroy

## Apps

- **Recuperando a configuração para conectar no cluster**:

```sh
aws eks update-kubeconfig --name nginx --region us-east-1 --profile academy
```

```sh
kubectl get nodes
```

- **Criando aplicação de exemplo**:

```sh
kubectl create namespace eks-sample-app
```

```sh
kubectl apply -f apps/sample/deployment.yml
```

```sh
kubectl apply -f apps/sample/service.yml
```

```sh
kubectl get all -n eks-sample-app
```

```sh
kubectl logs -n eks-sample-app pod/eks-sample-linux-deployment-66cfbc47b7-b44tt
```

```sh
kubectl delete -f apps/sample/deployment.yml
```

```sh
kubectl delete -f apps/sample/service.yml
```

## Resources

- [EKS Cluster Using Terraform + IAM Roles for Service Accounts & EKS Cluster Autoscaler](https://www.youtube.com/watch?v=MZyrxzb7yAU)
