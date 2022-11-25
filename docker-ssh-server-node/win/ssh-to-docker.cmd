docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" ssh-server-node

ssh my_user@localhost -p 2222
