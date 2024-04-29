packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:jammy"
  commit = true
}

source "docker" "fedora" {
  image  = "fedora:39"
  commit = true
}


build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu",
    "source.docker.fedora",
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    script = "provision_python.sh"
  }
}
