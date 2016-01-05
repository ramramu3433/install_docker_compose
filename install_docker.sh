#!/bin/bash
which docker >/dev/null
if [ "$?" -ne "0" ]; then
  install_docker
  install_compose
else
  echo "Docker already exists..."
fi

install_docker() {
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
  apt update
  apt purge lxc-docker*
  apt install -y docker-engine
}

install_compose() {
  curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

