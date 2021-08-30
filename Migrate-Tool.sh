#!/bin/bash
echo "Created by Kasiimh1 - https://gist.github.com/kasiimh1/6c856393f622b816febdaeffd8e9f4c6"

echo "Enter Source VPS IP"
read sourceIP

echo "Installing dependencies"
sudo apt-get update

sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        p7zip-full \
        software-properties-common -y

echo "Zipping Source StorX-Node folder for migration"        
ssh root@$sourceIP 'sudo apt-get install p7zip-full && 7z a StorX-Node.zip StorX-Node/'

echo "Copying files to new VPS"
scp -r root@$sourceIP:/root/StorX-Node.zip ./

echo "Inflating files to /StorX-Node"
sudo 7z x StorX-Node.zip
cd StorX-Node

echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

sudo apt-get update
sudo apt-get install docker-ce -y

echo "Installing Docker-Compose"

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    
chmod +x /usr/local/bin/docker-compose
sleep 5
echo "Docker Compose Installed successfully"

echo "Upgrading StorX Network Configuration Scripts"

git pull
echo "Upgrading Docker Images"
sudo docker pull storxnetwork/storxnode:latest

echo "Shutting Down Source Node"
ssh root@$sourceIP 'cd StorX-Node && sudo docker-compose -f docker-services.yml down'

echo "Shutting Down Node"
sudo docker-compose -f docker-services.yml down

echo "Starting Up Node"

sudo docker-compose -f docker-services.yml up -d
echo "Congrats! Your Node has been successfully updated with latest changes and been migrated to new VPS!"