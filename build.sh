#!/usr/bin/sh

error() {
    echo "$@" 1>&2
}

fail() {
    error "$@" && exit 1
}

print_usage() {
    printf "Usage: build.sh [build_file.xml]\n"
    printf "Build a Docker image with OpenDDS installed (by using configure or autobuild tool)\n"
}

if [ $# -eq 0 ]; then
    cp Dockerfile_configure Dockerfile
elif [ $# -eq 1 ]; then 
    cp Dockerfile_autobuild Dockerfile
else 
    print_usage
    exit 1;
fi
 
docker build --no-cache=true -t docker_opendds .
