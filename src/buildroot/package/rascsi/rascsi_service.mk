################################################################################
#
## rascsi_service
#
#################################################################################

RASCSI_VERSION = 1.0
RASCSI_SOURCE = rascsi-$(LIBFOO_VERSION).tar.gz
RASCSI_SITE = http://www.foosoftware.org/download
RASCSI_LICENSE = BSD-3-Clause
RASCSI_LICENSE_FILES = LICENSE
RASCSI_INSTALL_STAGING = YES
#RASCSI_CONFIG_SCRIPTS = libfoo-config
RASCSI_DEPENDENCIES += libspdlog
RASCSI_DEPENDENCIES += ZLIB

define RASCSI_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RASCSI_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/rascsi  $(STAGING_DIR)/usr/bin
	$(INSTALL) -D -m 0644 $(@D)/rasctl  $(STAGING_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/scsimon $(STAGING_DIR)/usr/bin
endef

define RASCSI_INSTALL_TARGET_CMDS
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
