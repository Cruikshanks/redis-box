#!/bin/bash -x

sudo apt-get -y install redis-server

# Redis is automatically added to startup so the following line is not needed
# update-rc.d redis-server defaults
