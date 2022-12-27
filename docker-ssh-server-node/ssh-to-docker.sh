#!/bin/sh

set -x
set -e

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-server-node

ssh my_user@127.0.0.1 -p 2222

#ssh my_user@127.0.0.1 -p 2222 -L 3000:127.0.0.1:3000
