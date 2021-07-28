#!/bin/bash

dname="dockerapache"

echo "Docker build"
docker build -t $dname .
echo "Success"
echo "Show images"
docker image ls
echo "Docker run"
docker run -dit --name $dname -p 80:80 $dname
echo "Success"
echo "docker container ls"
docker container ls
