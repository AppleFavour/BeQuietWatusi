export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.0
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.1.sdk

TWEAK_NAME = BeQuietWatusi
$(TWEAK_NAME)_FILES = BeQuietWatusi.xm
$(TWEAK_NAME)_CFLAGS += -fobjc-arc
INSTALL_TARGET_PROCESSES = net.whatsapp.WhatsApp

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
include $(THEOS)/makefiles/tweak.mk

c:
	find . -name ".DS_Store" -delete
	rm -rf .theos/ build/