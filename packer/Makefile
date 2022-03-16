MYVAR = "hello"
SUBDIRS = fedora ubuntu

.PHONY: subdirs $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -k --warn-undefined-variables -C $@
