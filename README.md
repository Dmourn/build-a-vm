# build-a-vm
Who doesn't like a good virtual machine?

These Makefiles will build you some :)

There are a few preparatory steps to take first.

# Pre-requisites

## Hardware things


Defaults per build are:

* 8192 MB of ram
* 10 GB of storage
* 4 cpus

These can be changed in the top-level Makefile.

Besides storage, these have no effect on how you run the images later.

## Software things

Requires cloud-localds script. can be installed with the cloud-utils package (fedora, ubuntu, arch, others?)
or [here](https://github.com/canonical/cloud-utils)

You must also have qemu-system\* and qemu-img installed.

You may need to add your user to the kvm group on some systems.

## Image things

**Put the qcow images you want to in the image folder.** 

There is a helper script `get-images.sh`, but don't count on image verification (manually verify the images)
It needs some work to deal with the fact Ubuntu does not version their SHASUM files.

It will grab the following images

* [focal-server-cloudimg-amd64.img](https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img)
* [jammy-server-cloudimg-amd64.img](https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img)
* [Fedora-Cloud-Base-35-1.2.x86_64.qcow2](https://fedora.mirrorservice.org/fedora/linux/releases/35/Cloud/x86_64/images/Fedora-Cloud-Base-35-1.2.x86_64.qcow2)

These images are explicitly referenced in the Makefiles.	

Cloud-init user-data files are in in cloud-init/\*/http/user-data


# Build the VMs

```
make cloud-init
```
You may specify the -j flag to build multiple machines at a time.

The output of the build will be in a log file in the image's directory

To clean up:

```
make clean
```

default creds are **auser:dabestpassword**

**You should disable this by locking the password and importing ssh-keys**
See the comments in the user-data files and/or read the [cloud-init docs](https://cloudinit.readthedocs.io/en/latest/).

# Broken things

The packer directory is vestigial and used as a reference. It should still work by uncommenting the packer rules.

The aarch64 Makefile has not been updated and so will not run with the above command. It still assumes the qcow image is in the same directory.
You will also need the edk-UEFI firmare to make the pflash image, and specify the path to said firmware.

## TODO

make Makefiles less hacky and more general.
