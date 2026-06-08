include $(TOPDIR)/rules.mk

PKG_NAME:=qca-nss-dp
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://git.codelinaro.org/clo/qsdk/oss/lklm/nss-dp.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2026-01-19
PKG_SOURCE_VERSION:=d8f802f08fd8ff31057ba58edb20bbe448e7b505
PKG_MIRROR_HASH:=e990afc68ac816c9e373fc05196360c5c3315f0e71ddb841b075142c45823c97

PKG_BUILD_PARALLEL:=1
PKG_FLAGS:=nonshared

PKG_CONFIG_DEPENDS:= \
	CONFIG_TARGET_qualcommax_ipq807x \
	CONFIG_TARGET_qualcommax_ipq60xx \
	CONFIG_TARGET_qualcommax_ipq50xx

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

QCA_SSDK_SYMVERS:=$(PKG_SYMVERS_DIR)/qca-ssdk.symvers

define KernelPackage/qca-nss-dp
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  DEPENDS:=@TARGET_qualcommax +kmod-qca-ssdk
  TITLE:=Qualcomm NSS dataplane ethernet driver
  FILES:=$(PKG_BUILD_DIR)/qca-nss-dp.ko
  AUTOLOAD:=$(call AutoLoad,31,qca-nss-dp,1)
endef

define KernelPackage/qca-nss-dp/Description
  NSS dataplane ethernet driver for Qualcomm SoCs.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/qca-nss-dp
	$(CP) $(PKG_BUILD_DIR)/exports/* $(1)/usr/include/qca-nss-dp/
endef

EXTRA_CFLAGS+= \
	-I$(STAGING_DIR)/usr/include/qca-ssdk

NSS_DP_HAL_DIR:=$(PKG_BUILD_DIR)/hal
define Build/Configure
	$(CP) $(NSS_DP_HAL_DIR)/soc_ops/$(CONFIG_TARGET_SUBTARGET)/nss_$(CONFIG_TARGET_SUBTARGET).h \
		$(PKG_BUILD_DIR)/exports/nss_dp_arch.h
endef

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) \
		-C "$(LINUX_DIR)" \
		M="$(PKG_BUILD_DIR)" \
		KBUILD_EXTRA_SYMBOLS="$(QCA_SSDK_SYMVERS)" \
		NSS_DP_INCLUDE="-I$(PKG_BUILD_DIR)/include -I$(PKG_BUILD_DIR)/exports -I$(PKG_BUILD_DIR)/hal/include -I$(PKG_BUILD_DIR)/hal/dp_ops/include -I$(PKG_BUILD_DIR)/hal/dp_ops/edma_dp/edma_v1/include -I$(STAGING_DIR)/usr/include/qca-ssdk" \
		EXTRA_CFLAGS="$(EXTRA_CFLAGS)" SoC="$(CONFIG_TARGET_SUBTARGET)" \
		modules
endef

$(eval $(call KernelPackage,qca-nss-dp))
