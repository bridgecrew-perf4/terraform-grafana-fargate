


resource "aws_iam_role" "grafana_role" {
  name = "grafana_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

data "aws_iam_policy_document" "grafana" {
  statement {
    sid = "1"

    actions = [
        "ec2:*",
        "ecs:*",
        "ecr:*",
        "autoscaling:*",
        "elasticloadbalancing:*",
        "application-autoscaling:*",
        "logs:*",
        "tag:*",
        "resource-groups:*"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "grafana" {
  name   = "grafana_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.grafana.json
}

resource "aws_iam_role_policy_attachment" "grafana-attach" {
  role       = aws_iam_role.grafana_role.name
  policy_arn = aws_iam_policy.grafana.arn
}