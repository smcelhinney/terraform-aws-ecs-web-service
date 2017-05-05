variable "project" {
  default = "Unknown"
}

variable "environment" {
  default = "Unknown"
}

variable "ecs_service_role_policy_arn" {
  default = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

variable "vpc_id" {}

variable "name" {}

variable "public_subnet_ids" {
  type = "list"
}

variable "access_log_bucket" {}

variable "access_log_prefix" {}

variable "health_check_path" {
  default = "/"
}

variable "port" {}

variable "ssl_certificate_arn" {}

variable "cluster_name" {}

variable "task_definition_id" {}

variable "desired_count" {
  default = "1"
}

variable "deployment_min_healthy_percent" {
  default = "100"
}

variable "deployment_max_percent" {
  default = "200"
}

variable "container_name" {}

variable "container_port" {}
