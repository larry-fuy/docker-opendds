#!/bin/sh

docker run -it --privileged -v $PWD/scripts:/scripts --rm docker_opendds /bin/bash

