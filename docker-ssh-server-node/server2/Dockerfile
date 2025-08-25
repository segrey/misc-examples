# Build and run:
#   docker build -t clion/ubuntu/cpp-env:1.0 -f Dockerfile.cpp-env-ubuntu .

FROM ubuntu:22.04

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata

RUN apt-get update \
  && apt-get install -y build-essential \
      gcc \
      g++ \
      gdb \
      clang \
      make \
      ninja-build \
      cmake \
      autoconf \
      automake \
      libtool \
      valgrind \
      locales-all \
      dos2unix \
      rsync \
      tar \
      python3-dev \
      wget \
  && apt-get clean

RUN cd home && wget https://download.jetbrains.com/cpp/CLion-2022.2.4.tar.gz \
  && tar xvzf CLion-*.tar.gz -C /opt/
RUN echo "set auto-load safe-path /" >> /etc/gdb/gdbinit


RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y vim

ARG MY_USER

RUN useradd -rm -d "/home/$MY_USER" -s /bin/bash -g root -G sudo "$MY_USER"

RUN mkdir /var/run/sshd

RUN echo "$MY_USER:1" | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

USER root

ENTRYPOINT service ssh restart && bash
