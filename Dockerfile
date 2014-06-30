FROM yongfu/tao_ace
MAINTAINER Yong Fu <larry.yong.fu@hotmail.com>

RUN apt-get update -q
RUN apt-get install perl -y

# OpenDDS
RUN wget  http://download.ociweb.com/OpenDDS/OpenDDS-3.5.tar.gz
RUN tar -xvf OpenDDS-3.5.tar.gz -C /opt
ENV DDS_ROOT /opt/DDS
ENV PATH $PATH:$DDS_ROOT/bin
# there is a bug in Docker so we cannot use (https://github.com/dotcloud/docker/issues/2637)
# ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$ACE_ROOT/lib
# instead we use this
ENV LD_LIBRARY_PATH $ACE_ROOT/lib:$DDS_ROOT/lib

# build OpenDDS
RUN cd $DDS_ROOT; make
# test OpenDDS
RUN $DDS_ROOT/bin/auto_run_tests.pl
RUN rm -f OpenDDS-3.5.tar.gz
