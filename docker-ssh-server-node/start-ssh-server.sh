#!/bin/sh

set -x

. ./stop-ssh-server.sh

set -e

docker build --build-arg MY_USER=my_user -t ssh-server-node:latest .
docker run -P -p 2222:22 --rm -it --name ssh-server-node ssh-server-node:latest
