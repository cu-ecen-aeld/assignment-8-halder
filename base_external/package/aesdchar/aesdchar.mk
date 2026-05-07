##############################################################
#
# AESDCHAR
#
##############################################################
# manual link: https://buildroot.org/downloads/manual/manual.html
# follow 18.20 of the documentation for making a `kernel-module` mk file

AESDCHAR_VERSION = 85575e128d24d90ee2eb1d081a3ebd5d5db87382
AESDCHAR_SITE = "git@github.com:cu-ecen-aeld/assignments-3-and-later-halder.git"
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver

define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
