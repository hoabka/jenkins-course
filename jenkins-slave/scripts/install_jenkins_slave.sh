#!/usr/bin/env bash

#Create jenkins home dir at host
mkdir -p /var/jenkins_home_slave/.ssh
cp ./id_rsa.pub /var/jenkins_home_slave/.ssh/authorized_keys

#Change Mode for .ssh dir
chmod 700 /var/jenkins_home_slave/.ssh
chmod 600 /var/jenkins_home_slave/.ssh/authorized_keys
chown -R 1000:1000 /var/jenkins_home_slave

#docker run Jenkins slave image
docker run -p 2222:22 -v /var/jenkins_home_slave:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --restart always -d --name jenkins-slave hoabka/jenkins-slave:latest