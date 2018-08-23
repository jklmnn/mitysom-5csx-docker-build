#!/bin/bash

cd /opt/yocto/poky
source ./oe-init-build-env
bitbake meta-toolchain
bitbake mitysom-5csx-dev-kit
cp -av /opt/yocto/poky/build/tmp/deploy/images/mitysom-5csx-h6-53b /opt/target/
mkimage -n 'Ramdisk Image' -A arm -O linux -T ramdisk -C gzip -d /opt/target/mitysom-5csx-h6-53b/mitysom-5csx-dev-kit-mitysom-5csx-h6-53b.cpio.gz /opt/target/mitysom-5csx-h6-53b/initramfs.uImage
rm -rfv /opt/yocto/poky/build
