#!/bin/bash

VERSION=${1:-6.0.22}

docker create --volumes-from=unifi-controller --name unifi-volumes unify:${VERSION}-systemd
docker stop unifi-controller
docker rm unifi-controller
docker run -itd --name unifi-controller --restart=always --ulimit nofile=122880:122880 --privileged --net=host --volumes-from unifi-volumes unify:${VERSION}-systemd
