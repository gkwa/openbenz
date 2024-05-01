packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }

    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "docker" "ubuntu" {
  image  = "docker.io/taylorm/mytest"
  commit = true
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
  }
}
