#!/bin/bash

apt-get install -y build-essential libffi-dev libssl-dev python python-dev python-setuptools git
easy_install pip
pip install -U ansible

rm -rf /home/vagrant/ansible
