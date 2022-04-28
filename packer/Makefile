
SUBDIRS = fedora

.PHONY: subdirs $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -k --warn-undefined-variables -C $@

# .PHONY: clean-convert
#clean-convert: $(SUBDIRS)
clean-convert:
	#$(MAKE) -k --warn-undefined-variables -C $(dirs) $(MAKECMDGOALS)
	for d in $(SUBDIRS) ; do make -k --warn-undefined-variables -C $$d $(MAKECMDGOALS) ; done
