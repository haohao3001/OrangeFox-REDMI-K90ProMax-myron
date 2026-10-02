#
# Copyright (C) 2026 OrangeFox Recovery Project
# Device: Xiaomi myron (POCO F8 Ultra / Redmi K90 Pro Max)
# Branch: OrangeFox 14.1
# SoC   : Snapdragon 8 Elite Gen 5 (SM8850 / canoe)
#
# SPDX-License-Identifier: Apache-2.0
#
# v6 — PATCHED from ROM dump:
#   - service names corrected (vendor.keymint, vendor.weaver_nxp)
#   - se_omapi removed (OMAPI = Java app com.android.se on myron)
#   - all missing libs added from ROM dump
#   - libjc_weaver_transport.so / mi_weaver.so removed (not on ROM)
#

DEVICE_PATH := device/xiaomi/myron

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 36
#允许4 KB对齐的二进制文件,getconf PAGESIZE的值为4096,因此关闭检查无影响
PRODUCT_CHECK_PREBUILT_MAX_PAGE_SIZE := false
# ─── Dynamic partitions ───────────────────────────────────────────────────────
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_VIRTUAL_AB_OTA         := true

# ─── Fuse passthrough ─────────────────────────────────────────────────────────
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# ─── Soong namespaces ─────────────────────────────────────────────────────────
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# ___ Soong Fix
PRODUCT_APEX_SYSTEM_SERVER_JARS += com.android.crashrecovery:service-crashrecovery

# ─── lptools ──────────────────────────────────────────────────────────────────
PRODUCT_PACKAGES += \
    lpflash \
    lpmake \
    lpunpack

# ─── Release key ──────────────────────────────────────────────────────────────
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/releasekey