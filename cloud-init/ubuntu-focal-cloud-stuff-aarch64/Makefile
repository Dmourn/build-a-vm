
CLOUD_IMAGE=focal-server-cloudimg-arm64.img
# CLOUD_IMAGE=focal-server-cloudimg-amd64.img
#ALLOCATED_MEMORY=8192
#IMAGE_NAME=useme.qcow2 
#IMAGE_SIZE=5
ARCH=aarch64


all: pflash0.img pflash1.img my-seed.img ${IMAGE_NAME}

pflash0.img:
	dd status=progress if=/dev/zero of=$@ bs=1M count=64
	# Ubuntu
	# dd status=progress if=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd of=$@ conv=notrunc
	# Fedora
	dd status=progress if=/usr/share/edk2/aarch64/QEMU_EFI.fd of=$@ conv=notrunc
 
pflash1.img: pflash0.img
	dd status=progress if=/dev/zero of=$@ bs=1M count=64

LOG.log:
	touch LOG.log

my-seed.img:
	cloud-localds -m local ${SEED_IMG} ./http/user-data 

#useme.qcow2:
${IMAGE_NAME}: my-seed.img 
	./img2qcow convert -s ${IMAGE_SIZE} -t ${IMAGE_NAME} -i ${CLOUD_IMAGE}

flash-clean: pflash0.img pflash1.img
	rm $^

clean: my-seed.img useme.qcow2 LOG.log
	rm my-seed.img useme.qcow2 LOG.log

.PHONY: run
run:
	./run -c 8 -m ${ALLOCATED_MEMORY} -t ${IMAGE_NAME} -b my-seed.img -a ${ARCH} 
