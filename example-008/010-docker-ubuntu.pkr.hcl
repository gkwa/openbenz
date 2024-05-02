packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "container_registry" {
  type    = string
  default = "docker.io"
}

variable "docker_io_login_username" {
  type      = string
  default   = env("DOCKER_IO_LOGIN_USERNAME")
  sensitive = true
}

variable "docker_io_login_password" {
  type      = string
  default   = env("DOCKER_IO_LOGIN_PASSWORD")
  sensitive = true
}

source "docker" "ubuntu" {
  image       = "ubuntu:jammy"
  export_path = "010-docker-ubuntu.tar"
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    script = "provision.sh"
  }

  post-processors {
    post-processor "docker-import" {
      repository = "docker.io/taylorm/mytest4"
      tag        = "latest"
    }
    post-processor "docker-push" {
      login          = true
      login_server   = var.container_registry
      login_username = var.docker_io_login_username
      login_password = var.docker_io_login_password
    }
  }
}
