#!/bin/bash
install_docker() {
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
  sudo apt update
  sudoapt purge lxc-docker*
  sudo apt install -y docker-engine
}

install_compose() {
  sudo curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

which docker >/dev/null
if [ "$?" -ne "0" ]; then
  install_docker
  install_compose
else
  echo "Docker already exists..."
fi

