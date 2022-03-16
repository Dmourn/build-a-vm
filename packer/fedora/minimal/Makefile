
TEMPLATE_DIR=./templates
BUILD_DIR=./build
IMAGE_NAME=fedora-35-minimal
ALT_FORMATS = vmdk vhdx

.PHONY: convert $(ALT_FORMATS)
convert: $(ALT_FORMATS) build
$(ALT_FORMATS):
	qemu-img convert -f qcow2 -O $@ ${BUILD_DIR}/$(IMAGE_NAME).qcow2 ${BUILD_DIR}/$(IMAGE_NAME).$@

build:
	packer build ${TEMPLATE_DIR}/$(IMAGE_NAME).pkr.hcl

#convert: build
	#qemu-img convert -f qcow2 -O vhdx ${BUILD_DIR}/$(IMAGE_NAME).qcow2 ${BUILD_DIR}/$(IMAGE_NAME).vhdx
	#qemu-img convert -f qcow2 -O vmdk ${BUILD_DIR}/$(IMAGE_NAME).qcow2 ${BUILD_DIR}/$(IMAGE_NAME).vmdk

.PHONY: clean-convert
clean-convert:
	rm -v ./$(BUILD_DIR)/$(IMAGE_NAME).v*

.PHONY: clean
clean:
	rm -r ./build
