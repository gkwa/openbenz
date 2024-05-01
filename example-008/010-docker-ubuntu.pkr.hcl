packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
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
    inline = [
      "apt-get update",
      "apt-get -y install python3 python3-pip",
      "apt-get -y install bash", // Install bash explicitly
      "apt-get clean",
      "rm -rf /var/lib/apt/lists/*"
    ]
  }

  post-processors {
    post-processor "docker-import" {
      repository = "docker.io/taylorm/mytest"
      tag        = "latest"
    }
    post-processor "docker-push" {}
  }
}
