#!/bin/sh
cd /opt/DDS 
svn update
./configure
make
RUN chmod +x ./setenv.sh && ./setenv.sh
