TARGET := iphone:7.0:2.0
ARCHS := armv6 arm64
PACKAGE_VERSION := $(shell ./version.sh)

include theos/makefiles/common.mk

TWEAK_NAME := Veency
Veency_FILES := Tweak.mm SpringBoardAccess.c

Veency_FRAMEWORKS := 
Veency_FRAMEWORKS += CoreSurface
Veency_FRAMEWORKS += GraphicsServices
Veency_FRAMEWORKS += IOMobileFramebuffer
Veency_FRAMEWORKS += QuartzCore
Veency_FRAMEWORKS += UIKit

ADDITIONAL_LDFLAGS += -weak_framework IOKit

ADDITIONAL_OBJCFLAGS += -Wno-gnu
ADDITIONAL_OBJCFLAGS += -Wno-dangling-else

ADDITIONAL_OBJCFLAGS += -idirafter xnu-2422.1.72/iokit
ADDITIONAL_OBJCFLAGS += -idirafter xnu-2422.1.72/libkern
ADDITIONAL_OBJCFLAGS += -idirafter xnu-2422.1.72/osfmk
ADDITIONAL_OBJCFLAGS += -idirafter include

ADDITIONAL_OBJCFLAGS += -Ilibvncserver
ADDITIONAL_OBJCFLAGS += -Xarch_armv6 -Ilibvncserver.armv6
ADDITIONAL_OBJCFLAGS += -Xarch_arm64 -Ilibvncserver.arm64

ADDITIONAL_CFLAGS += -fvisibility=hidden

ADDITIONAL_LDFLAGS += -Xarch_armv6 -Llibvncserver.armv6/libvncserver/.libs
ADDITIONAL_LDFLAGS += -Xarch_arm64 -Llibvncserver.arm64/libvncserver/.libs
ADDITIONAL_LDFLAGS += -lvncserver

ADDITIONAL_LDFLAGS += -Xarch_armv6 -Llibjpeg.armv6/.libs
ADDITIONAL_LDFLAGS += -Xarch_arm64 -Llibjpeg.arm64/.libs
ADDITIONAL_LDFLAGS += -ljpeg

ADDITIONAL_LDFLAGS += -lz

ADDITIONAL_LDFLAGS += -F/System/Library/PrivateFrameworks
ADDITIONAL_LDFLAGS += -weak_reference_mismatches weak

ADDITIONAL_CFLAGS += -mllvm -arm-reserve-r9
ADDITIONAL_LDFLAGS += -Xarch_armv6 -Wl,-lgcc_s.1

include $(THEOS_MAKE_PATH)/tweak.mk
