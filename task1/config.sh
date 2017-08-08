#!/bin/bash
apt-get update -y
apt-get install -y git
git clone -b task1 https://github.com/mdanilchenko/devops_training.git
cat devops_training/README.md
