#!/bin/bash
yum update -y
yum install -y git
ssh-agent bash -c 'ssh-add /shared/id_rsa'
git clone -b task1 https://github.com/mdanilchenko/devops_training.git
cat devops_training/README.md
