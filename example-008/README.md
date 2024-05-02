```bash
export DOCKER_IO_LOGIN_USERNAME={secret} DOCKER_IO_LOGIN_PASSWORD='{secret}'

packer init 010-docker-ubuntu.pkr.hcl
packer init 020-docker-ubuntu.pkr.hcl
packer build 010-docker-ubuntu.pkr.hcl
packer build 020-docker-ubuntu.pkr.hcl

```
