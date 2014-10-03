FROM ubuntu:latest
MAINTAINER Yong Fu

RUN apt-get update -q
RUN apt-get install subversion perl build-essential curl -y

# Install OpenDDS
# Readme : http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/DDS/docs/INSTALL
RUN cd /opt && svn co svn://svn.dre.vanderbilt.edu/DOC/DDS/trunk
# run script to automatically download the TAO/ACE and compile
WORKDIR /opt/trunk
RUN ./configure
RUN make
RUN chmod +x ./setenv.sh && ./setenv.sh
