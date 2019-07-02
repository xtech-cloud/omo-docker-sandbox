# ************************************** 
#
# OMO Sandbox
#
# ENV: PROD
# VERSION: 1.0.0
#
# *************************************

FROM alpine:3.10

MAINTAINER Easlee Liu "liu@easlee.me"

ENV container docker

###############################
# install applications
###############################
RUN apk add --no-cache openssh
RUN apk add --no-cache bash

###############################
# allow root login
###############################
RUN sed -i 's/#PermitRootLogin[ ]prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

###############################
# generate ssh key
###############################
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key

###############################
# change password
###############################
RUN echo root:omosandbox > /root/passwd

RUN mkdir -p /omo

EXPOSE 22
COPY entry.sh /usr/local/bin/

ENTRYPOINT ["entry.sh"]
