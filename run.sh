#!/bin/sh

error() {
    echo "$@" 1>&2
}

fail() {
    error "$@" && exit 1
}

print_usage() {
    printf "Usage: run [build_file.xml]\n"
    printf "Run OpenDDS on Docker (by using configure or autobuild tool)\n"
}

if [ $# -eq 0 ]; then
    docker run -d --privileged docker_opendds /scripts/dds_install_configure.sh
else if [ $# -eq 1]; then
#    docker run -d docker_opendds /scripts/dds_install_autobuild.sh $1
else 
    print_usage
    exit 1;
fi


