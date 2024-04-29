packer {
  required_plugins {
    incus = {
      version = ">= 1.0.0"
      source  = "github.com/bketelsen/incus"
    }
  }
}

packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "jammy" {
  image  = "ubuntu:jammy"
  commit = true
}

source "incus" "jammy" {
  image        = "images:ubuntu/jammy"
  output_image = "ubuntu-jammy"
  reuse        = true
}

source "incus" "fedora39" {
  image        = "images:fedora/39"
  output_image = "fedora-fedora39"
  reuse        = true
}

source "docker" "fedora" {
  image  = "fedora:39"
  commit = true
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.jammy",
    "source.docker.fedora",
    "source.incus.jammy",
    "source.incus.fedora39",
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    script = "provision_python.sh"
  }
}

