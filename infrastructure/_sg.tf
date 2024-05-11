# resource "aws_security_group" "sg" {

#   name        = "SG-${var.project_name}"
#   description = "Grupo destinado a projeto de EKS da FIAP"
#   vpc_id      = data.aws_vpc.default_vpc.id

#   ingress {
#     description = "ALL"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # TODO : Adicionar ingress da VPC
#   ingress {
#     description = "VPC"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"] # Aqui a VPC
#   }

#   egress {
#     description = "ALL"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
