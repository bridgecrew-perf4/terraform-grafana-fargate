

resource "aws_ecs_cluster" "fargate" {
  name = local.cluster_name
}

data "template_file" "grafana" {
  template = file("./task-definitions/grafana.json.tpl")

  vars = {
    tag                 = "latest"
    cpu                 = var.fargate_cpu
    memory              = var.fargate_memory
    aws_region          = var.aws_region
    aws_ecr_repository  = var.aws_ecr_repository
    cloudwatch_log_group = aws_cloudwatch_log_group.grafana.name
  }
}
resource "aws_ecs_task_definition" "grafana" {
  family                = "grafana"
  execution_role_arn    = aws_iam_role.grafana_role.arn
  container_definitions = data.template_file.grafana.rendered
  network_mode             = "awsvpc"
  requires_compatibilities = [ "FARGATE" ]

  cpu                      = 1024
  memory                   = 2048

#   volume {
#     name      = "service-storage"
#     host_path = "/ecs/service-storage"
#   }

}

resource "aws_ecs_service" "grafana" {
  name            = "grafana"
  cluster         = aws_ecs_cluster.fargate.id
  task_definition = aws_ecs_task_definition.grafana.arn
  desired_count   = 1
#   iam_role        = aws_iam_role.grafana_role.arn
  launch_type = "FARGATE"
  depends_on      = [aws_iam_role.grafana_role]

  load_balancer {
    target_group_arn = aws_lb_target_group.grafana.arn
    container_name   = "grafana"
    container_port   = 3000
  }
  network_configuration {
    subnets = aws_subnet.public.*.id
    assign_public_ip = false
    security_groups = [aws_security_group.grafana.id]
  }

}