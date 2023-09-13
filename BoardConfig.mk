# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Core 64bit only 
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# A/B support
AB_OTA_UPDATER := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += aop abl xbl xbl_config vm-bootsys tz hyp dsp engineering_cdt oplus_sec keymaster qweslicstore oplusstanvbk cpucp uefisecapp featenabler imagefv qupfw devcfg shrm multiimgoem splash bluetooth odm system_ext system vendor vendor_dlkm modem boot dtbo vendor_boot product special_preload my_stock my_bigball my_heytap my_product my_region my_manifest my_engineering my_carrier vbmeta vbmeta_vendor vbmeta_system

# Assert
TARGET_OTA_ASSERT_DEVICE := RE54BFL1,RMX3461

# Bootloader
PRODUCT_PLATFORM := lahaina
TARGET_BOOTLOADER_BOARD_NAME := lahaina
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := lahaina
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true
QCOM_BOARD_PLATFORMS += lahaina

# Bootirecoveryimg flags
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := false

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_KERNEL_CMDLINE := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    pcie_ports=compat \
    service_locator.enable=1 \
    swiotlb=0 \
    ip6table_raw.raw_before_defrag=1 \
    iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# DTB
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 201326592

# Enable AVB & Enable chained vbmeta for boot images
BOARD_AVB_ENABLE := true

# includes make_f2fs to support userdata partition in f2fs
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 10200547328
BOARD_SUPER_PARTITION_GROUPS := oneplus_dynamic_partitions
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor vendor_dlkm
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 10196353024 # BOARD_SUPER_PARTITION_SIZE - 4MB

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
BOARD_USES_VENDOR_DLKMIMAGE := true

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true

# Add root folders
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Enables proper handling of /data/media
RECOVERY_SDCARD_ON_DATA := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2127-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Add properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# MISC FLAGS
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file"

# Fixes wrong theme color
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# TWRP Configuration
TW_THEME := portrait_hdpi

# Add TW_DEVICE_VERSION
TW_DEVICE_VERSION := Ts1-by_U89-sk

# All language packs
TW_EXTRA_LANGUAGES := true

# Brightness flags
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 3276
TW_DEFAULT_BRIGHTNESS := 1713

# CPU temp sysfs path, if it is zero all the time
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone50/temp"

# Calculate the system date and time
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Statusbar icons flags
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "170"

# Use mke2fs for formatting ext4 partitions
TARGET_USES_MKE2FS := true

# For mounting NTFS
TW_INCLUDE_NTFS_3G := true

# exFAT FS support
TW_INCLUDE_FUSE_EXFAT := true

# Add support of able to wake with touch after sleep
TW_NO_SCREEN_BLANK := true

# Logical partitions
TW_INCLUDE_LOGICAL := my_bigball my_carrier my_company my_custom my_engineering my_heytap my_manifest my_preload my_product my_region my_stock my_version

# EDL Mode (qcom)
TW_HAS_EDL_MODE := true

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

# Blacklist certain input devices that might break touch in TWRP
TW_INPUT_BLACKLIST := "hbtp_vm"

# Remove vibration support
TW_NO_HAPTICS := true

# Toolbox binaries
TW_USE_TOOLBOX := true

# Include libresetprop binaries
TW_INCLUDE_LIBRESETPROP := true

# Include resetprop binary from the Magisk tools kit to the assembly
TW_INCLUDE_RESETPROP := true

# Include magiskboot for repacking bootimg
TW_INCLUDE_REPACKTOOLS := true

# Don't mount apex files (no need for now)
TW_EXCLUDE_APEX := true

# Use our own USB config
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Twrp app exclude flags
TW_EXCLUDE_TWRPAPP := true

# Debug-tools
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Log touch input
TWRP_EVENT_LOGGING := true
