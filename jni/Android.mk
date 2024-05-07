LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := ppause
LOCAL_SRC_FILES := ppause.c
include $(BUILD_SHARED_LIBRARY)