packer {
 required_plugins {
   docker = {
     version = ">= 1.0.8"
     source = "github.com/hashicorp/docker"
   }
 }
}

source "docker" "ubuntu" {
 image = "ubuntu:jammy"
 export_path = "010-docker-ubuntu.tar"
}

build {
 name = "learn-packer"
 sources = [
   "source.docker.ubuntu"
 ]

 post-processors {
   post-processor "docker-import" {
     repository = "docker.io/taylorm/mytest4"
     tag = "latest"
   }
   post-processor "docker-push" {
   }
 }
}
