#!/usr/bin/sh

# default installation is to use ./configure
cp  Dockerfile_configure Dockerfile

if [ $1 == "autobuild" ] ; then
    cp Dockerfile_autobuild Dockerfile
fi

docker build --no-cache=true -t docker_opendds .
