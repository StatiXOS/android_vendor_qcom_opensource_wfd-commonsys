LOCAL_PATH := $(call my-dir)


#--------------------------------------------------------------------------------
# BUILD FOR SYSTEM PARTITION
#Guard compilation of system modules from vendor-target as these modules would be
#scanned during vendor compilation. With introduction of groups feature, this would
#raise compilation issues as certain commonsys deliverables would be missing
ifneq ($(filter $(QSSI_SUPPORTED_PLATFORMS),$(PRODUCT_BOARD_PLATFORM)),)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := aacEncode.cpp
LOCAL_SRC_FILES += aacDecode.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(TOP)/external/aac/libAACenc/include
LOCAL_C_INCLUDES += $(TOP)/external/aac/libAACdec/include
LOCAL_C_INCLUDES += $(TOP)/external/aac/libSYS/include

LOCAL_SHARED_LIBRARIES := liblog
LOCAL_SHARED_LIBRARIES += libminijail
LOCAL_SHARED_LIBRARIES += libavservices_minijail
LOCAL_SHARED_LIBRARIES += vendor.display.config@2.0
LOCAL_SHARED_LIBRARIES += libdisplayconfig.qti
LOCAL_STATIC_LIBRARIES := libFraunhoferAAC

LOCAL_32_BIT_ONLY := true
LOCAL_MODULE := libwfdaac
LOCAL_CFLAGS += -O0
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_SANITIZE := integer_overflow
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := aacEncode.cpp
LOCAL_SRC_FILES += aacDecode.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(TOP)/external/aac/libAACenc/include
LOCAL_C_INCLUDES += $(TOP)/external/aac/libAACdec/include
LOCAL_C_INCLUDES += $(TOP)/external/aac/libSYS/include

LOCAL_HEADER_LIBRARIES += libutils_headers

LOCAL_SHARED_LIBRARIES := liblog
LOCAL_SHARED_LIBRARIES += libminijail
LOCAL_SHARED_LIBRARIES += libavservices_minijail
LOCAL_SHARED_LIBRARIES += vendor.display.config@2.0
LOCAL_SHARED_LIBRARIES += libdisplayconfig.qti
LOCAL_STATIC_LIBRARIES := libFraunhoferAAC

LOCAL_VENDOR_MODULE := true

LOCAL_32_BIT_ONLY := true
LOCAL_MODULE := libwfdaac_vendor
LOCAL_CFLAGS += -O0

LOCAL_SANITIZE := integer_overflow
include $(BUILD_SHARED_LIBRARY)

endif
