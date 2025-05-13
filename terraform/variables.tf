variable "app_name" {
  default = "flask-app"
}
variable "image_name" {
  default = "flask-k8s-app:latest"
}
variable "container_port" {
  default = 5000
}