#!/bin/sh

build_name=$1
if ![ -f build_name.xm ]; then
    printf "cannot find $build_name.xml..."
    exit 1;
fi

build_base=/tao_builds/taoadmin
build_dir=$build_base/$build_name

## mount the autobuild tool from OCI (internal use with --privileged to run docker)
# mkdir /distcomp
# sudo mount -t nfs beetle:/distcomp /distcomp -o nolock

# download autobuild
cd / && svn co svn://svn.dre.vanderbilt.edu/ACE/autobuild/trunk autobuild

# create build workspace
mkdir -p $build_dir && cd $build_dir
cp /scripts/$build_name.xml ./

## download MPC
curl -O http://downloads.ociweb.com/MPC/MPC_4_1_0.tar.gz
tar -xvzf *.tar.gz

# run autobuild
/autobuild/autobuild.pl -v2 $build_name.xml
