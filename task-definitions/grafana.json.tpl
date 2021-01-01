[
    {
      "name": "grafana",
      "image": "${aws_ecr_repository}:${tag}",
      "networkMode": "awsvpc",
      "cpu": ${cpu},
      "memory": ${memory},
      "portMappings": [
        {
          "containerPort": 3000,
          "hostPort": 3000
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${cloudwatch_log_group}",
          "awslogs-stream-prefix": "containers",
          "awslogs-region": "us-east-1"
        }
      }
    }
]