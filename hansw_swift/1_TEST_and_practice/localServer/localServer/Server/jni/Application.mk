# The ARMv7 is significanly faster due to the use of the hardware FPU
# 너무 많이 컴파일 해서 배포전까지만 코멘트
APP_PLATFORM := android-14
APP_STL := c++_static
#NDK 11 에서 error: format not a string literal and no format arguments [-Werror=format-security] 에러가 나서 아래의 것을 추가해주어야 한다.
APP_CFLAGS += -Wno-error=format-security  

# EX
#APP_ABI=all32 is equivalent to APP_ABI=armeabi,armeabi-v7a,x86,mips.
#APP_ABI=all64 is equivalent to APP_ABI=arm64-v8a,x86_64,mips64.

# DEBUG
#APP_ABI := armeabi-v7a arm64-v8a #x86 x86_64 #armeabi armeabi-v7a #all
#APP_OPTIM := debug
#설정 : C++ : Command Builder 에 ndk-build NDK_DEBUG=1로 설



# RELEASE
#APP_ABI := armeabi-v7a armeabi arm64-v8a mips64
APP_ABI := armeabi-v7a arm64-v8a x86 x86_64 





