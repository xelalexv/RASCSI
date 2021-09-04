VERSION ?= "1.25"

.PHONY: all clean install bin-all
all clean install bin-all:
	make -C ./src/raspberrypi $@

.PHONY: release

release: rascsi-$(VERSION).tar.gz

rascsi-$(VERSION).tar.gz:
	tar -zcvf rascsi-$(VERSION).tar.gz ./src/raspberrypi/* ./doc/* ./src/web/* ./src/oled_monitor/* LICENSE easyinstall.sh Makefile
	echo $@
