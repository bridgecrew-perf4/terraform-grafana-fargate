
resource "aws_cloudwatch_log_group" "grafana" {
  name = "/aws/ecs/grafana"
  retention_in_days = 1
  tags = {
    Environment = "production"
    Application = "Grafana-Fargate"
  }
}