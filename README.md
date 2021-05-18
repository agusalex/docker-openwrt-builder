# Docker OpenWrt Builder

Build [OpenWrt](https://openwrt.org/) images in a Docker container. 
Build tested:

It does not build the old LEDE images.

## Prerequisites

* Docker installed
* running Docker daemon
* build Docker image:

```
git clone https://github.com/agusalex/docker-openwrt-builder.git
cd docker-openwrt-builder
docker build -t openwrt_builder .
```

Now the docker image is available. These steps only need to be done once.

## Usage GNU/Linux

Create a build folder and link it into a new docker container:
```
mkdir ~/mybuild
docker run -v ~/mybuild:/openwrt/bin/target -it agusalex/docker-openwrt-builder /bin/bash
```

In the container console, enter:
```
make menuconfig
make -j4
```

After the build, the images will be inside `~/mybuild/bin/target/`.

## Usage Windows

TODO

## Other Projects

Other, but very similar projects:
* [docker-openwrt-buildroot](https://github.com/noonien/docker-openwrt-buildroot)
* [openwrt-docker-toolchain](https://github.com/mchsk/openwrt-docker-toolchain)

