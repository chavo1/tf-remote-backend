#! /bin/bash

TERRAFORM_VERSION=${TERRAFORM_VERSION}


# Install packages
which unzip jq vim curl sshpass &>/dev/null || {
    apt-get update -y
    apt-get install unzip jq vim curl  -y 
}
########################
# Installing terraform #
########################
sudo mkdir -p /vagrant/pkg

which consul || {
    # check if consul file exist.
    CHECKFILE="/vagrant/pkg/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
    if [ ! -f "$CHECKFILE" ]; then
        pushd /vagrant/pkg
        wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        popd
    fi
    
    pushd /usr/local/bin/
    unzip /vagrant/pkg/terraform_${TERRAFORM_VERSION}_linux_amd64.zip 
    sudo chmod +x terraform
    popd
}