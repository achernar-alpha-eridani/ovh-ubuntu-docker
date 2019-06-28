#!/bin/sh

# This is the Achernar OVH initialization script!
#
# Are you looking at this in your web browser, and would like to setup a new Achernar OVH machine?
#
# On the OVH Linux machine:
#   Just open up your terminal and type:
#
#     curl https://install.achernar.me/ | sh
#
#   Achernar OVH initialization script will install and configure:
#    - Docker CE

run_it () {

    RELEASE="1.0.0"
    OS=$(lsb_release -si | tr [:upper:] [:lower:])

    if [ "$OS" != "ubuntu" ] ; then
        echo "Sorry, this OS $OS is not supported yet via this installer."
        exit 1
    fi

    sudo apt update
    sudo apt upgrade -y
    sudo apt install apt-transport-https ca-certificates curl software-properties-common git -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install docker-ce -y
    sudo systemctl status docker

}

run_it
