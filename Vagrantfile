TERRAFORM_VERSION = '0.12.0-beta1'

Vagrant.configure(2) do |config|
    config.vm.box = "chavo1/xenial64base"
    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 2   
    end

      ###############
      #  Terraform  #
      ###############

      config.vm.define "terraform" do |terraform|
        terraform.vm.hostname = "terraform"
        terraform.vm.provision "shell",inline: "cd /vagrant ; bash scripts/terraform.sh", env: {"TERRAFORM_VERSION" => TERRAFORM_VERSION}
    end
  end
