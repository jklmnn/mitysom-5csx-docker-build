FROM ubuntu:14.04

USER root

RUN apt update
RUN apt upgrade -y
RUN apt install -y git build-essential python wget chrpath gawk texinfo bc u-boot-tools

RUN mkdir -p /opt/yocto
RUN git clone -b dora git://git.yoctoproject.org/poky /opt/yocto/poky
RUN git clone -b dora git://support.criticallink.com/home/git/meta-mitysom-5csx.git /opt/yocto/poky/meta-mitysom-5csx
RUN git clone -b dora git://git.openembedded.org/meta-openembedded /opt/yocto/poky/meta-openembedded

ADD scripts /opt/yocto/poky
RUN mkdir -p /opt/yocto/poky/build/conf
ADD conf /opt/yocto/poky/build/conf

RUN mkdir -p /opt/target

RUN /opt/yocto/poky/build.sh
