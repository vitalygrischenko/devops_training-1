#!/bin/bash
sudo yum update -y
sudo yum install -y git
sudo ssh-agent bash -c 'ssh-add /shared/id_rsa'
git clone -b task1 https://github.com/mdanilchenko/devops_training.git
