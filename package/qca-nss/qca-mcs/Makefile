include $(TOPDIR)/rules.mk

PKG_NAME:=qca-mcs
PKG_RELEASE:=2

PKG_SOURCE_URL:=https://git.codelinaro.org/clo/qsdk/oss/lklm/qca-mcs.git
PKG_SOURCE_DATE:=2025-10-08
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=da120b1
PKG_MIRROR_HASH:=9d9d04fa44bddc66f2f4605f12303b6694b4debdb5b44ee47432c4d768350f83
QSDK_VERSION:=13.1
PKG_VERSION:=$(QSDK_VERSION).$(subst -,.,$(PKG_SOURCE_DATE))~$(PKG_SOURCE_VERSION)

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/qca-mcs
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Support
  URL:=http://www.qca.qualcomm.com
  MAINTAINER:=Qualcomm Atheros, Inc.
  TITLE:=QCA Multicast Snooping Support
  DEPENDS:=@TARGET_qualcommax \
	+@KERNEL_IPV6_MROUTE \
	+@KERNEL_IP_MROUTE
  KCONFIG:=CONFIG_NETFILTER=y
  FILES:=$(PKG_BUILD_DIR)/qca-mcs.ko
  AUTOLOAD:=$(call AutoLoad,42,qca-mcs)
endef

define KernelPackage/qca-mcs/description
  This package installs the IGMP/MLD Snooping Module.
endef

QCA_MC_SNOOPING_HEADERS:= \
	$(PKG_BUILD_DIR)/mc_api.h \
	$(PKG_BUILD_DIR)/mc_ecm.h

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/qca-mcs
	$(INSTALL_DATA) $(QCA_MC_SNOOPING_HEADERS) $(1)/usr/include/qca-mcs/
	$(INSTALL_DATA) $(QCA_MC_SNOOPING_HEADERS) $(1)/usr/include/
endef

EXTRA_CFLAGS += -Wno-implicit-fallthrough

QCA_MC_SNOOPING_MAKE_OPTS:= \
	CONFIG_SUPPORT_MLD=y \
	MDIR=$(PKG_BUILD_DIR) \
	KBUILDPATH=$(LINUX_DIR) \
	KERNELPATH=$(LINUX_SRC_DIR) \
	KERNELRELEASE=$(LINUX_RELEASE)

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) \
		$(PKG_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
		$(strip $(QCA_MC_SNOOPING_MAKE_OPTS)) \
		modules
endef

$(eval $(call KernelPackage,qca-mcs))
