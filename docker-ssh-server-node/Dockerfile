# https://www.techrepublic.com/article/deploy-docker-container-ssh-access/
# https://stackoverflow.com/a/61738823

FROM node:18

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y vim

ARG MY_USER

RUN useradd -rm -d "/home/$MY_USER" -s /bin/bash -g root -G sudo "$MY_USER"

RUN mkdir /var/run/sshd

RUN echo "$MY_USER:1" | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

USER "$MY_USER"

RUN echo 'cd /home/my_user/my-projects/misc-examples' >> "/home/$MY_USER/.bashrc"

RUN mkdir "/home/$MY_USER/my-projects"
RUN git clone https://github.com/segrey/misc-examples.git "/home/$MY_USER/my-projects/misc-examples"
WORKDIR "/home/$MY_USER/my-projects/misc-examples"

USER root

ENTRYPOINT service ssh restart && bash
