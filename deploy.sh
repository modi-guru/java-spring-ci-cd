#!/bin/bash

IMAGE=$1

if docker ps | grep petclinic-blue; then
  NEW="green"
  PORT=8081
  OLD="blue"
else
  NEW="blue"
  PORT=8080
  OLD="green"
fi

docker pull $IMAGE

docker rm -f petclinic-$NEW || true

docker run -d -p $PORT:8080 --name petclinic-$NEW $IMAGE

sleep 10

if docker ps | grep petclinic-$NEW; then
  docker rm -f petclinic-$OLD || true
else
  echo "New container failed"
  exit 1
fi

