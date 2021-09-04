VERSION ?= 1.25

.PHONY: all clean install
all clean install:
	make -C ./src/raspberrypi $@

.PHONY: release

release: rascsi-$(VERSION).tar.gz

rascsi-$(VERSION).tar.gz:
	tar -zcvf rascsi-1.25.tar.gz ./src/raspberrypi/* ./doc/* ./src/web/* ./src/oled_monitor/* LICENSE easyinstall.sh
