CHANGME = $(MYVAR)

BTARGETS = minimal rstudio

.PHONY: targets $(BTARGETS)
targets: $(BTARGETS)

$(BTARGETS):
	$(MAKE) --warn-undefined-variables -C $@

clean-convert: 
	$(MAKE) -C minimal clean-convert
	$(MAKE) -C rstudio clean-convert

clean:
	#$(MAKE) -C ${BTARGETS} clean
	$(MAKE) -C minimal clean
	$(MAKE) -C rstudio clean

