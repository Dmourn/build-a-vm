CLOUD_IMAGE=jammy-server-cloudimg-amd64.img

ARCH=x86_64

all: ${SEED_IMG} ${IMAGE_NAME} run

${SEED_IMG}:
	cloud-localds -m local ./${SEED_IMG} ./http/user-data 

${IMAGE_NAME}: my-seed.img 
	${SCRIPT_DIR}/img2qcow convert -s ${IMAGE_SIZE} -t ${IMAGE_NAME}-${CLOUD_IMAGE} -i ${IMAGE_DIR}${CLOUD_IMAGE} \
		&& printf "Creating base \033[92m${IMAGE_NAME}-${CLOUD_IMAGE} SUCCESS\033[0m\n" || printf "Creating base \033[91m${IMAGE_NAME}-${CLOUD_IMAGE} FAILURE\033[0m\n"

clean:
	rm ${SEED_IMG} ${IMAGE_NAME}-${CLOUD_IMAGE} run

run:
	${SCRIPT_DIR}/run -c ${ALLOCATED_CPUS} -m ${ALLOCATED_MEMORY} -t ${IMAGE_NAME}-${CLOUD_IMAGE} -b ${SEED_IMG} -a ${ARCH} > ${IMAGE_NAME}-${CLOUD_IMAGE}.log \
			&& printf "Final \033[92m${IMAGE_NAME}-${CLOUD_IMAGE} SUCCESS\033[0m\n" || printf "Final \033[91m${IMAGE_NAME}-${CLOUD_IMAGE} FAILURE\033[0m\n"
	touch run
