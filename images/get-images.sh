#!/bin/bash

IMAGE_LIST=( \
	https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img \
	https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img \
	https://fedora.mirrorservice.org/fedora/linux/releases/35/Cloud/x86_64/images/Fedora-Cloud-Base-35-1.2.x86_64.qcow2
)

CHECKSUM_LIST=( \
	https://cloud-images.ubuntu.com/focal/current/SHA256SUMS \
	https://getfedora.org/static/checksums/35/images/Fedora-Cloud-35-1.2-x86_64-CHECKSUM
)
for iso in ${IMAGE_LIST[@]} ; do
	iso_name=${iso##*/} #$(python3 -c "print('$iso'.split('/')[-1])")
	if [[ ! -e $iso_name ]]; then
		wget $iso -O ./$iso_name
	fi
done

for sum in ${CHECKSUM_LIST[@]} ; do
	wget $sum -O ./${sum##*/}
	sha256sum -c ${sum##*/}
done

# rsync -vLzhhP rsync://cdimage.ubuntu.com/cdimage/daily-preinstalled/current/jammy-preinstalled-desktop-arm64+raspi.img.xz ./images/
# rsync -vLzhhP rsync://cdimage.ubuntu.com/cdimage/daily-preinstalled/current/SHA256SUMS .
# sha256sum -c SHA256SUMS && echo 'Done!' || echo 'hash failed....' 

# vi ts=4 noexpandtab
