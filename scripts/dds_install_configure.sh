#!/bin/sh
cd /DDS 
svn update
./configure
chmod +x ./setenv.sh && ./setenv.sh
make
