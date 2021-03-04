
data "aws_lambda_function" main {
  function_name = var.lambda_name
}

resource aws_lb_listener_rule main {
  listener_arn = var.alb_listener.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
  condition {
    path_pattern {
      values = var.alb_path
    }
  }
  condition {
    http_request_method {
      values = var.alb_request_methods
    }
  }

  depends_on = [aws_lb_target_group.main]
}

resource aws_lambda_alias alias {
  name             = var.alias_name
  description      = var.alias_description
  function_name    = data.aws_lambda_function.main.arn
  function_version = data.aws_lambda_function.main.version
}

resource aws_lb_target_group main {
  name        = var.target_group_name
  target_type = "lambda"
}

resource aws_lambda_permission alb {
  statement_id  = "AllowExecutionFromALB"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.main.function_name
  principal     = "elasticloadbalancing.amazonaws.com"
  qualifier     = aws_lambda_alias.alias.name
  source_arn    = aws_lb_target_group.main.arn
}

resource aws_lb_target_group_attachment main {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_lambda_alias.alias.arn
  depends_on = [
    aws_lambda_permission.alb,
    aws_lambda_alias.alias
  ]
}
