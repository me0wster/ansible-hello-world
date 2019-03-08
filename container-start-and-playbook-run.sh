#!/bin/bash
### FROM ###
### https://medium.com/@ayeshasilvia/testing-ansible-playbook-in-a-docker-container-21628e9ee256

DOCKER_CONTAINER_NAME="ansible-test"

cd docker && docker build -t mycentos .

docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 mycentos

cd ../ansible && ansible-playbook -i env/local_docker myplaybook.yml -v
docker stop $DOCKER_CONTAINER_NAME

docker rm -f -v $DOCKER_CONTAINER_NAME
