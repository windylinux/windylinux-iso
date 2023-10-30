#!/usr/bin/bash
# shellcheck disable=SC2034

iso_name="windylinux"
iso_label="windylinux-v0.1.0"
iso_publisher="WindyLinux <https://github.com/windylinux>"
iso_application="WindyLinux Live/Rescue CD"
iso_version="v0.1.0"
install_dir="arch"
buildmodes=('iso')
bootmodes=('uefi-x64.systemd-boot.esp')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
file_permissions=(
	["/etc/shadow"]="0:0:0400"
	["/etc/gshadow"]="0:0:0400"
)
