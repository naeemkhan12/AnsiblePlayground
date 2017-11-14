#!/bin/bash
sudo apt-get update
sudo apt-get install vagrant -y
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y
