variable "alias_name" {
  description = "The alias name for this Lambda"
  default     = "live"
}

variable "alias_description" {
  description = "The description for this Lambda alias"
  default     = "Live alias"
}

variable "alb_path" {
  description = "The path on the ALB to set up the listener to"
  default     = ["/default"]
}

variable "alb_listener" {
  description = "The listener to bind this association to"
}

variable "lambda_name" {
  description = "Lambda name"
}

variable alb_request_methods {
  description = "The request methods to be created on the ALB."
  type        = list(string)
  default     = ["OPTIONS", "GET"]
}

variable target_group_name {
  description = "Target group name."
}