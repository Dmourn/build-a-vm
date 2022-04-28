MY_TARGETS = fedora-35-cloud-stuff-amd64 ubuntu-focal-cloud-stuff-amd64 ubuntu-jammy-cloud-stuff-amd64
all: ${MY_TARGETS}

.PHONY: ${MY_TARGETS}
${MY_TARGETS}:
	make -C $@

clean:
	@for i in ${MY_TARGETS} ; do make --directory=$$i clean ; done


