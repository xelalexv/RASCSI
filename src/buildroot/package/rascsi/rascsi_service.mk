################################################################################
#
## rascsi_service
#
#################################################################################

RASCSI_VERSION = 1.32
RASCSI_SOURCE = rascsi-$(RASCSI_VERSION).tar.gz
RASCSI_SITE = file:///home/akuker
RASCSI_LICENSE = BSD-3-Clause
RASCSI_LICENSE_FILES = LICENSE
RASCSI_INSTALL_STAGING = YES
#RASCSI_CONFIG_SCRIPTS = libfoo-config
RASCSI_DEPENDENCIES += spdlog
RASCSI_DEPENDENCIES += libzlib
RASCSI_CFLAGS = -Dasdf
RASCSI_STRIP_COMPONENTS = 0

define RASCSI_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) bin-all
endef

define RASCSI_INSTALL_STAGING_CMDS
endef

define RASCSI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/src/raspberrypi/bin/fullspec/rascsi  $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/src/raspberrypi/bin/fullspec/rasctl  $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/src/raspberrypi/bin/fullspec/scsimon $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/doc/rascsi.1 $(TARGET_DIR)/usr/share/man/man1
	$(INSTALL) -D -m 0755 $(@D)/doc/rasctl.1 $(TARGET_DIR)/usr/share/man/man1
	$(INSTALL) -D -m 0755 $(@D)/doc/scsimon.1 $(TARGET_DIR)/usr/share/man/man1
endef

#	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
#	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
#endef

define RASCSI_USERS
endef
#	foo -1 libfoo -1 * - - - LibFoo daemon
#endef
#
define RASCSI_DEVICES
endef
#	/dev/foo  c  666  0  0  42  0  -  -  -
#endef
#
define RASCSI_PERMISSIONS
endef
#	/bin/foo  f  4755  foo  libfoo   -  -  -  -  -
#endef

$(eval $(generic-package))
