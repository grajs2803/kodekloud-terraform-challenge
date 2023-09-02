variable "image" {
  type = string
  default = "kodekloud/webapp-color:v1"
}
variable "replicas" {
  type = number
  default = 1
}
variable "container_name" {
  type = string
  default = "simple-webapp"
}
variable "deployment_name" {
    type = string
    default = "frontend"
}
variable "container_port" {
    type = number
    default = 8080
} 
variable "template_metadata_labels" {
  type = map(string)
  default = {
    name = "webapp"
  }
}