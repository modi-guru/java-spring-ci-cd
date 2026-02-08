#!/bin/bash

IMAGE=$1

echo "Pulling image $IMAGE"
docker pull $IMAGE

echo "Removing old container"
docker rm -f petclinic || true

echo "Starting new container"
docker run -d -p 8080:8080 --name petclinic $IMAGE

