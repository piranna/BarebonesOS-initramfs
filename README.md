[![Build Status](https://semaphoreci.com/api/v1/piranna/barebonesos-initramfs/branches/master/badge.svg)](https://semaphoreci.com/piranna/barebonesos-initramfs)

# BarebonesOS initramfs

[![Greenkeeper badge](https://badges.greenkeeper.io/piranna/barebonesos-initramfs.svg)](https://greenkeeper.io/)

This package will generate an `initramfs` image with the minimal components to
make a diskless system bootable, suitable to be added into the Linux kernel.


## How to use

```sh
npm install
npm start
```

### Options

- b / BINARY: Location of the binary executable inside the initramfs
- l / LINUX: Location of the (probably patched) Linux kernel sources
- o / OUT_INITRAM: Location of the output initramfs image
- p / BINARY_PATH: Location of the binary executable
- r / SRC_RELEASE: Location of the OS release info file
