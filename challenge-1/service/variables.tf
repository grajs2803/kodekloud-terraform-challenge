variable "template_metadata_labels" {
  type = map(string)
  default = {
    name = "frontend"
  }
}
variable "port" {
  type = number
  default = 8080
}
variable "target_port" {
  type = number
  default = 8080
}
variable "node_port" {
  type = number
  default = 30080
}
variable "service_type" {
  type = string
  default = "NodePort"
}