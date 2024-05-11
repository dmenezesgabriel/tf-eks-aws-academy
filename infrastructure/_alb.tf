# resource "aws_alb" "alb" {
#   name               = "alb-${var.project_name}"
#   internal           = false
#   load_balancer_type = "application"
#   subnets            = ["${data.aws_subnet.subnet_a.id}", "${data.aws_subnet.subnet_b.id}", "${data.aws_subnet.subnet_c.id}"]
#   security_groups    = [data.aws_security_group.default.id]
#   idle_timeout       = 60
# }

# resource "aws_alb_listener" "listener" {
#   load_balancer_arn = aws_alb.alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tg.arn
#   }
# }
