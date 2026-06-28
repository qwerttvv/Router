#
# Copyright (C) 2022 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nss-firmware
PKG_VERSION:=2025.05.01
PKG_HASH:=10a4b1e69470db150915cb063525436494b8ae4eebb8b50ea6ad894082d7abb0
PKG_SOURCE_URL:=https://github.com/qosmio/qca-sdk-nss-fw/releases/download/v$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.zst
PKG_RELEASE:=1
PKG_FLAGS:=nonshared

PKG_LICENSE_FILES:=LICENSE.md

PKG_MAINTAINER:=Sean K <datapronix@protonmail.com>

PKG_CONFIG_DEPENDS:= \
	CONFIG_TARGET_SUBTARGET

include $(INCLUDE_DIR)/package.mk

RSTRIP:=:
STRIP:=:

NSS_PROFILE:=R
NSS_FIRMWARE_SUBTARGET:=$(subst ",,$(CONFIG_TARGET_SUBTARGET))
NSS_FIRMWARE_PLATFORM_ipq807x:=IPQ8074
NSS_FIRMWARE_PLATFORM_ipq60xx:=IPQ6018
NSS_FIRMWARE_PLATFORM_ipq50xx:=IPQ5018
NSS_FIRMWARE_SOC_ipq807x:=HK
NSS_FIRMWARE_SOC_ipq60xx:=CP
NSS_FIRMWARE_SOC_ipq50xx:=MP
NSS_FIRMWARE_PLATFORM:=$(NSS_FIRMWARE_PLATFORM_$(NSS_FIRMWARE_SUBTARGET))
NSS_FIRMWARE_SOC:=$(NSS_FIRMWARE_SOC_$(NSS_FIRMWARE_SUBTARGET))

define Package/nss-firmware-common
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=NSS firmware
  URL:=$(PKG_SOURCE_URL)
  DEPENDS:=@TARGET_qualcommax
endef

define Package/nss-firmware
$(call Package/nss-firmware-common,$(1))
endef

define nss-firmware-version
	override NSS_MAJOR=12
	override NSS_MINOR=5
	override NSS_REL=210
	override VERSION_PATH=$(PKG_BUILD_DIR)/QCA_Networking_2024.SPF_12.5/ED1
endef

define Build/Compile
endef

define Package/nss-firmware/install
	$(eval $(call nss-firmware-version))
	[ -n "$(NSS_FIRMWARE_PLATFORM)" ] || { \
		echo "Unsupported qualcommax NSS firmware subtarget: $(NSS_FIRMWARE_SUBTARGET)" >&2; \
		exit 1; \
	}
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/$(NSS_FIRMWARE_PLATFORM)
	$(TAR) --strip-components=1 -C $(PKG_BUILD_DIR)/$(NSS_FIRMWARE_PLATFORM) -xf \
		$(VERSION_PATH)/$(NSS_FIRMWARE_PLATFORM).ATH.$(NSS_MAJOR).$(NSS_MINOR)/BIN-NSS*.$(NSS_MAJOR).$(NSS_MINOR)*-$(NSS_REL)*$(NSS_PROFILE).tar.bz2
	$(INSTALL_DIR) $(1)/lib/firmware/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/$(NSS_FIRMWARE_PLATFORM)/retail_router0.bin \
		$(1)/lib/firmware/qca-nss0-retail.bin
ifeq ($(NSS_FIRMWARE_SOC),HK)
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/$(NSS_FIRMWARE_PLATFORM)/retail_router1.bin \
		$(1)/lib/firmware/qca-nss1-retail.bin
endif
endef

$(eval $(call BuildPackage,nss-firmware))
