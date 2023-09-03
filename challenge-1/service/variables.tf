variable "service_selector" {
  type = map(string)
  default = {
    name = "webapp"
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