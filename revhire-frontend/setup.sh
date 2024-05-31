#!/bin/bash

# Update the system
sudo apt-get update -y

# Install Java (required for Jenkins)
sudo apt-get install openjdk-11-jdk -y

# Install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

#install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Install Docker
sudo apt install docker.io -y
sudo service docker start
sudo systemctl enable docker

# Install AWS CLI
sudo apt-get install unzip -y
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_amd64.zip
unzip terraform_1.8.2_linux_amd64.zip -d /usr/local/bin/


# Clean up
rm -f awscliv2.zip terraform_0.14.7_linux_amd64.zip

# Install Node.js and npm
sudo apt-get install nodejs npm -y

# Install Angular CLI globally
sudo npm install -g @angular/cli
