#docker-opendds

Build or run OpenDDS on docker.

# OpenDDS 

[OpenDDS](http://www.opendds.org/) is an open-source C++
implementation of the Object Management Group's specification "Data
Distribution Service for Real-time Systems". OpenDDS is built on the
[ACE](http://www.dre.vanderbilt.edu/~schmidt/ACE-overview.html)
abstraction layer to provide platform portability. OpenDDS also
leverages capabilities of
[TAO](http://www.dre.vanderbilt.edu/~schmidt/TAO-overview.html), such
as its IDL compiler and as the basis of the OpenDDS DCPS Information
Repository (DCPSInfoRepo).

## Requirement

[Docker](https://docs.docker.com/installation/#installation) (version >= 0.9)

[docker-TAO](https://github.com/larry-fuy/docker-TAO)

## Installation

There are two approaches to build and run OpenDDS:

### Build by configure 

1. DDS is delivered by a build script ```configure```, which can
download ACE/TAO/DDS source code and configure build environment and
then complete building automatically. This is a recommended approach.

2. ACE/TAO is shipped with a building tool named ```autobuild```. The
tool goes throug the whole building process by reading a instruction
xml file, which provides building environment and commands. This
approach is more flexible than the above building approach.

### Build and run

1.  Run ```build.sh ``` to get Docker image (see usage). For ```configure```
build, the source code and runtime are under ```/DDS```. For
```autobuild```, the source code and runtime are under
```/tao_builds/taoadmin/dds_build/``` or
```/tao_builds/taoadmin/[xml_name_you_provide]````.

*Note: if you choose autobuild, you have to provide a .xml configuration file.*

2.  Run ```docker run -it --privileged -v $PWD/scripts:/scripts --rm
docker_opendds /bin/bash ``` or ```./run.sh``` directly.

Installation reference [Install OpenDDS on Linux](http://www.opendds.org/building.html).


