#!/bin/bash

sudo docker kill newImage
sudo docker remove newImage

sudo docker image rm w267bxh/project4:latest
sudo docker pull w267bxh/project4:latest
sudo docker run -d -p 8080:80 --name newImage --restart unless-stopped w267bxh/project4:latest
