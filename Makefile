export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.0
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.1.sdk

FINALPACKAGE = 1
DEBUG = 0

TWEAK_NAME=ShutUpWatusi
$(TWEAK_NAME)_FILES = ShutUpWatusi.xm
$(TWEAK_NAME)_CFLAGS += -fobjc-arc
INSTALL_TARGET_PROCESSES = net.whatsapp.WhatsApp

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
include $(THEOS)/makefiles/tweak.mk