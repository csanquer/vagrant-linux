#!/bin/bash

chmod u=rw,go= ~/.ssh/id_rsa
chmod u=rw,go=r ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys