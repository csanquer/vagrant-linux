#!/bin/bash

chmod u=rw,go= ~/.ssh/id_rsa
chmod u=rw,go=r ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

echo $DOCKER_HUB_LOGIN
if [ -n "$DOCKER_HUB_LOGIN" ]; then
    docker login -u $DOCKER_HUB_LOGIN -p $DOCKER_HUB_PASSWORD
fi
