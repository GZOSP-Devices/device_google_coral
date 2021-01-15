# Copyright (C) 2020 AOSiP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for an aosp Android
# build for marlin hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and du, hence its name.
#

# Boot animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Include GZ common configuration
include vendor/gzosp/config/common_full_phone.mk

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/coral/aosp_flame.mk)
-include device/google/coral/device-gzosp.mk

PRODUCT_NAME := gzosp_flame
PRODUCT_DEVICE := flame
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 4
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="flame" \
    PRIVATE_BUILD_DESC="flame-user 11 RQ1A.210105.002 6985033 release-keys"

BUILD_FINGERPRINT := "google/flame/flame:11/RQ1A.210105.002/6985033:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/flame/flame:11/RQ1A.210105.002/6985033:user/release-keys

$(call inherit-product-if-exists, vendor/google/flame/flame-vendor.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
