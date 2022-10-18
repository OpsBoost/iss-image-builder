[![ShellCheck](https://github.com/OpsBoost/image-builder/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/OpsBoost/image-builder/actions/workflows/shellcheck.yml)
# image-builder

- ESP with systemd-boot and kernel
- Root filesystem with either Alpine, Gentoo or FreeBSD
- Optional A/B partitioning scheme
- Optional read-only rootfs

## Usage
```
$ image-builder help

  Usage:

    image-builder build   TARGET: alpine|gentoo|freebsd
    image-builder create  TARGET: alpine|gentoo|freebsd
    image-builder write   DEVICE
    image-builder mount   [PARTITION: esp|rootfs]
    image-builder install
```
### Create disk image
```
$ image-builder create alpine
```
### Mount disk image
```
$ image-builder mount
```
### Write disk image
```
$ image-builder write /dev/sdb
```
## Alpine
Utilises [raspi-alpine/builder](https://github.com/raspi-alpine/builder) to build an armhf image for Raspberry Pi
## Gentoo
Fetches a custom kernel, custom binpkgs and an offical stage3 to
create a disk image  
### Build
#### Linux
```
$ image-builder build linux-kernel
```
##### Alpine
```
$ image-builder build alpine
```
##### Gentoo
```
$ image-builder build gentoo
```
#### FreeBSD
```
$ image-builder build freebsd
$ image-builder build freebsd-kernel
$ image-builder build freebsd-world
```
## Network
### Wifi
If a wpa_supplicant.conf exists it gets copied to the image during post-build.  
Alternatively if wifi credentials are supplied via env during post-build,
a config is created from those. Use WIFI_SECURITY, WIFI_ESSID, WIFI_PASSPHRASE, e.g. via
the file *ENVIRONMENT* to supply confguration

# Resources
[raspi-alpine builder](https://github.com/raspi-alpine/builder)  
[Gentoo Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64)  
[FreeBSD Handbook](https://docs.freebsd.org/en/books/handbook/)  
[systemd-boot](https://www.freedesktop.org/software/systemd/man/systemd-boot.html)
