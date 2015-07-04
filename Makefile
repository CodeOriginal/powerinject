export ARCHS = arm64
export TARGET = iphone:clang:8.1:8.1

include theos/makefiles/common.mk

FOR_RELEASE=1

TWEAK_NAME = PowerInject
PowerInject_FILES = Tweak.xm
PowerInject_FRAMEWORKS = UIKit
PowerInject_LIBRARIES += libcephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
	
SUBPROJECTS += powerinjectprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
