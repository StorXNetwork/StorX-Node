#!/bin/bash

echo "Upgrading StorX Network Configuration Scripts"
git pull
echo "Upgrading Docker Images"
sudo docker pull storxnetwork/storxnode:latest
sudo docker-compose -f docker-services.yml down
sudo docker-compose -f docker-services.yml up -d
echo "Congrats! Your Node has been successfully updated with latest changes!"