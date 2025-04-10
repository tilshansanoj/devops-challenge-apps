#!bin/bash

#install docker and docker compose
curl -sSL https://get.docker.com | sh 
sudo usermod -aG docker ubuntu

#install nginx
sudo apt-get update
sudo apt-get install -y nginx   

#login to AWS ECR
aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 058264177299.dkr.ecr.ap-southeast-1.amazonaws.com