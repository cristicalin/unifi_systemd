#!/bin/bash

VERSION=${1:-6.0.22}

docker build --build-arg VERSION=${VERSION} --ulimit nofile=122880:122880 --no-cache -t unify:${VERSION}-systemd .
