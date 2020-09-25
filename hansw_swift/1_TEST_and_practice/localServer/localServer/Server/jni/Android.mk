LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE    := libcrypto 
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libssl 
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/libssl.a
include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := WebServerLib

LOCAL_CFLAGS    := -O2 -W -Wall -pthread -pipe $(COPT) -Wformat-security

LOCAL_STATIC_LIBRARIES :=  libssl libcrypto

LOCAL_SRC_FILES := ../MiapsSV.cpp ../CMiapsWebServer.cpp ../CHttpClient.cpp ../MyDecoding.cpp ../../Zip/minizip/ioapi.c ../../Zip/minizip/mztools.c ../../Zip/minizip/unzip.c ../../Zip/minizip/zip.c ../../Common/mystring.cpp ../../MinkProtocol/src/StringBuffer.cpp ../../MinkProtocol/src/ArrayElement.cpp ../../MinkProtocol/src/ArrayList.cpp ../../MinkProtocol/src/baseutils.cpp  ../../MinkProtocol/src/base64.cpp ../../MinkProtocol/src/md5.cpp

LOCAL_LDLIBS := -llog -ljnigraphics -landroid -lz

LOCAL_C_INCLUDES := jni/include ../Zip/minizip ../MinkProtocol/include ../Common

include $(BUILD_SHARED_LIBRARY)

