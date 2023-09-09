LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),rmx3461)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
