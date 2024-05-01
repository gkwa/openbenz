variable "container_registry" {
 type = string
 default = "docker.io"
}

variable "docker_io_login_username" {
 type = string
 default = env("DOCKER_IO_LOGIN_USERNAME")
 sensitive = true
}

variable "docker_io_login_password" {
 type = string
 default = env("DOCKER_IO_LOGIN_PASSWORD")
 sensitive = true
}

docker_push {
 login = true
 login_server = var.container_registry
 login_username = var.docker_io_login_username
 login_password = var.docker_io_login_password
}
