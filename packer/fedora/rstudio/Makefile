
TEMPLATE_DIR=./templates
BUILD_DIR=./build
IMAGE_NAME=fedora-35-rstudio
ALT_FORMATS = vmdk vhdx

.PHONY: convert $(ALT_FORMATS)
convert: build $(ALT_FORMATS)
$(ALT_FORMATS):
	qemu-img convert -f qcow2 -O $@ ${BUILD_DIR}/$(IMAGE_NAME).qcow2 ${BUILD_DIR}/$(IMAGE_NAME).$@


build:
	packer build ${TEMPLATE_DIR}/$(IMAGE_NAME).pkr.hcl


.PHONY: clean-convert
clean-convert:
	rm -v ./$(BUILD_DIR)/$(IMAGE_NAME).v*

.PHONY: clean
clean:
	rm -r ./build
