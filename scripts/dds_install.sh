#!/bin/sh

# mount the autobuild tool
mkdir /distcomp
sudo mount -t nfs beetle:/distcomp /distcomp -o nolock

# create build workspace
mkdir -p /tao_builds/taoadmin

# run autobuild
cd /tao_builds/taoadmin/
cp /scripts/dds_oci_tao-2_2_0_localhost_linux_gcc_d1o0.xml ./

# download source code 
svn co svn://svn.dre.vanderbilt.edu/DOC/DDS/trunk
curl -O http://download.ociweb.com/TAO-1.6a/ACE+TAO-1.6a_with_latest_patches.tar.gz
tar -xvzf *.tar.gz
