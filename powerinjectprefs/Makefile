include theos/makefiles/common.mk

BUNDLE_NAME = PowerInjectPrefs
PowerInjectPrefs_FILES = pCORootListController.m
PowerInjectPrefs_INSTALL_PATH = /Library/PreferenceBundles
PowerInjectPrefs_FRAMEWORKS = UIKit
PowerInjectPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/PowerInjectPrefs.plist$(ECHO_END)
