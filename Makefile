
export IMAGE_DIR=${PWD}/images/
export SCRIPT_DIR=${PWD}/scripts/


# VM options
export SEED_IMG=my-seed.img
export ALLOCATED_MEMORY=8192 #MB
export IMAGE_NAME=USEME
export IMAGE_SIZE=10 #GB
export ALLOCATED_CPUS=4

.PHONY: cloud-init
cloud-init: images
	$(MAKE) -C $@

#.PHONY: packer
#packer: images
	#$(MAKE) -C $@

clean:
	cd cloud-init && make clean
