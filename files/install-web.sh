#!/bin/bash

sudo yum -y update
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd

echo "Copying the SSH Key to the server"
echo -e "ssh-rsa biBkucjlQ== johndoe@pc01" >> /home/ec2-user/.ssh/authorized_keys

cat <<EOF >> /var/www/html/index.html
<html>
<body style="background-color:black;">

<h1 style="color:grey; text-align: center;">Welcome to DevOps Solution Center!!!</h1>

<h1 style="color:white;text-align: center;">Our programs are designed to guide our audience in gaining comprehensive knowledge of DevOps and Kubernetes, enabling them to automate deployment, scaling, and managing application.</h1>

<h1 style="color:grey; text-align: center;">In this Session, We'll show you everything you'll need to become a DevOps Engineer:</h1>

<ul>
<h3 style="color:blue;text-align: center; font-size:30px">1. Linux</h3>
<h3 style="color:blue;text-align: center; font-size:30px">2. VMWare</h3>
<h3 style="color:blue;text-align: center; font-size:30px">3. AWS Cloud</h3>
<h3 style="color:blue;text-align: center; font-size:30px">4. Azure Cloud</h3>
<h3 style="color:blue;text-align: center; font-size:30px">5. Google Cloud</h3>
<h3 style="color:grey;text-align: center; font-size:30px">6. Ansible</h3>
<h3 style="color:grey;text-align: center; font-size:30px">7. Terraform IaC</h3>
<h3 style="color:grey;text-align: center; font-size:30px">8. Kubernestes</h3>
<h3 style="color:white;text-align: center; font-size:30px">9. OpenShift</h3>
<h3 style="color:white;text-align: center; font-size:30px">10. ArgoCD</h3>
<h3 style="color:white;text-align: center; font-size:30px">11. GitLab CICD Pipelines</h3>
<h3 style="color:white;text-align: center; font-size:30px">12. GitHub Actions Pipelines</h3>
</ul>
EOF

