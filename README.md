# Two-Tier web application automation with Terraform, Ansible and GitHub Actions

The objective of this assignment is to verify your skills in applying deployment automation, configuration management, and source control tools to create two-tier static web application hosting and configuration solution.
![Architecture Diagram](https://i.ibb.co/mXqWRSv/kusal.png)

Video Demontration: https://youtu.be/S1yCwstrTMo

## Prerequisites

Before deploying the infrastructure using Terraform, ensure the following pre-requisites are met:
- An AWS account with appropriate permissions to create VPCs, subnets, EC2 instances, and other necessary resources.
- Terraform installed on your local machine.
- Ansible installed on your local machine.
- An S3 bucket configured to store Terraform state. Make sure you have the necessary permissions to access this bucket.
  - create an S3 bucket named "kusal-project" (or any other globally unique name you prefer. If you use different name, please make sure to update it on your config.tf files).
  - Additionally, create folders within the bucket to organize Terraform state files for different components of your infrastructure:
    - `network/`
    - `webservers/`
    - `alb/`


## Deployment Instructions

Follow these steps to deploy the cloud network architecture:
1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/KusalThiwanka/Final-Project-ACS730.git
    ```
2. Navigate to the cloned repository directory:
    ```bash
    cd Final-Project-ACS730
    ```

## Manual Deployment:
1. Deploy Network:
    ```bash
    cd terraform/network
    terraform init
    terraform plan
    terraform apply -auto-approve
    ```
2. Deploy Webservers
    ```bash
    cd ../webservers
    ssh-keygen -t rsa  -f project_keypair
    terraform init
    terraform plan
    terraform apply -auto-approve
    ```
3. Deploy ApplicationLoadBalancer
    ```bash
    cd ../alb
    terraform init
    terraform plan
    terraform apply -auto-approve
    ```
4. Deploy Ansible
    ```bash
    cd ../../ansible
    ansible-playbook -i aws_ec2.yaml webserver_playbook.yaml
    ```
    
## Destruction Instructions
To destroy the infrastructure and clean up all resources created, follow these steps:

2. Destroy resources in Application Load Balancer
    ```bash
    cd ../webserver/alb
    terraform destroy -auto-approve
    ```
3. Destroy resources in Development Webservers
    ```bash
    cd ../webservers
    terraform destroy -auto-approve
    ```
4. Destroy resources in Development Network
    ```bash
    cd ../network
    terraform destroy -auto-approve
    ```

After destroying all components, you can optionally delete the S3 bucket and its contents used for storing Terraform state.
