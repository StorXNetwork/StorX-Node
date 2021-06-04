#!/bin/bash


function configureNode(){
    read -p "Please enter your XDC Address for StorX Rewards :- " WALLETADD
    echo "Your XDC Wallet Address is ${WALLETADD}"
    
    echo "Installing Git      "

    sudo apt-get update

    sudo apt-get install \
            apt-transport-https \
            ca-certificates \
            curl \
            git \
            software-properties-common -y

    echo "Clone StorX Node"

    git clone https://github.com/StorXNetwork/StorX-Node && cd StorX-Node
    sed -i "s/WALLETADD=WALLETADD/WALLETADD=${WALLETADD}/g" .env


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

    sudo docker-compose -f docker-services.yml up -d



}

function init(){

        configureNode
}


function main(){

    init
    
}

main