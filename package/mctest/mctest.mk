################################################################################
#
# mctest
#
################################################################################

#MCTEST_VERSION = master
#MCTEST_SITE = git@github.com:sonicyang/mctest.git
#MCTEST_SITE_METHOD = git
MCTEST_VERSION=master
MCTEST_SOURCE=mctest-$(MC_VERSION).tar.gz
MCTEST_SITE = http://github.com/sonicyang/mctest/tarball/$(MCTEST_VERSION)


MCTEST_DEPENDENCIES = linux

ifeq ($(BR2_arm),y)
	MCTEST_ARCH=arm
endif

ifeq ($(BR2_x86_64),y)
	MCTEST_ARCH=x86
endif

define MCTEST_BUILD_CMDS
	cd $(@D); $(TARGET_MAKE_ENV) ARCH=$(MCTEST_ARCH) TARGET=user CROSS_COMPILE=$(TARGET_CROSS) $(MAKE)
	cd $(@D); $(TARGET_MAKE_ENV) KDIR=$(LINUX_DIR) ARCH=$(MCTEST_ARCH) TARGET=kmod CROSS_COMPILE=$(TARGET_CROSS) $(MAKE)
endef

define MCTEST_INSTALL_TARGET_CMDS
	$(INSTALL) $(@D)/build/user/drivers/mctest $(TARGET_DIR)/root/
	$(INSTALL) $(@D)/build/kmod/drivers/mctest.ko $(TARGET_DIR)/root/
	$(INSTALL) $(@D)/README $(TARGET_DIR)/root/MCTEST.README
endef


$(eval $(generic-package))
