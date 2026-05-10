set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(ARM_GNU_TOOLCHAIN_ROOT "$ENV{ARM_GNU_TOOLCHAIN_ROOT}")
if(NOT ARM_GNU_TOOLCHAIN_ROOT)
  set(ARM_GNU_TOOLCHAIN_ROOT "/Applications/ArmGNUToolchain/15.2.rel1/arm-none-eabi")
endif()

if(EXISTS "${ARM_GNU_TOOLCHAIN_ROOT}/bin/arm-none-eabi-gcc")
  set(CMAKE_C_COMPILER "${ARM_GNU_TOOLCHAIN_ROOT}/bin/arm-none-eabi-gcc")
  set(CMAKE_CXX_COMPILER "${ARM_GNU_TOOLCHAIN_ROOT}/bin/arm-none-eabi-g++")
  set(CMAKE_ASM_COMPILER "${ARM_GNU_TOOLCHAIN_ROOT}/bin/arm-none-eabi-gcc")
  set(CMAKE_AR "${ARM_GNU_TOOLCHAIN_ROOT}/bin/arm-none-eabi-ar")
  set(CMAKE_RANLIB "${ARM_GNU_TOOLCHAIN_ROOT}/bin/arm-none-eabi-ranlib")
  set(CMAKE_SYSROOT "${ARM_GNU_TOOLCHAIN_ROOT}/arm-none-eabi")
else()
  set(CMAKE_C_COMPILER arm-none-eabi-gcc)
  set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
  set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
  set(CMAKE_AR arm-none-eabi-ar)
  set(CMAKE_RANLIB arm-none-eabi-ranlib)
endif()

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(ARCH_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard")

set(COMMON_FLAGS "-ffunction-sections -fdata-sections -fno-common -D__NuttX__")

set(CMAKE_C_FLAGS_INIT "${ARCH_FLAGS} ${COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${ARCH_FLAGS} ${COMMON_FLAGS} -std=gnu++17 -fno-exceptions -fno-rtti")
