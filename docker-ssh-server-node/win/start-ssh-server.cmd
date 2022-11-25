call "%~dp0\stop-ssh-server.cmd"

docker build --build-arg MY_USER=my_user -t ssh-server-node-img:latest "%~dp0\.."
docker run -P -p 2222:22 --rm -it --name ssh-server-node ssh-server-node-img:latest
