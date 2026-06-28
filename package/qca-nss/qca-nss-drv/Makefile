include $(TOPDIR)/rules.mk

PKG_NAME:=qca-nss-drv
PKG_RELEASE:=18

PKG_SOURCE_URL:=https://git.codelinaro.org/clo/qsdk/oss/lklm/nss-drv.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2026-01-12
PKG_SOURCE_VERSION:=6aa14c7
PKG_MIRROR_HASH:=de41e9b33549206fa5b5eb6fad20cf0de0c8f3b33498c6cac0724531007c738d
QSDK_VERSION:=13.1
PKG_VERSION:=$(QSDK_VERSION).$(subst -,.,$(PKG_SOURCE_DATE))~$(PKG_SOURCE_VERSION)

PKG_BUILD_PARALLEL:=1
PKG_FLAGS:=nonshared

PKG_CONFIG_DEPENDS:= \
	CONFIG_TARGET_SUBTARGET \
	CONFIG_NSS_DRV_BRIDGE_ENABLE \
	CONFIG_NSS_DRV_CRYPTO_ENABLE \
	CONFIG_NSS_DRV_GRE_ENABLE \
	CONFIG_NSS_DRV_GRE_REDIR_ENABLE \
	CONFIG_NSS_DRV_GRE_TUNNEL_ENABLE \
	CONFIG_NSS_DRV_IGS_ENABLE \
	CONFIG_NSS_DRV_IPV4_REASM_ENABLE \
	CONFIG_NSS_DRV_IPV6_ENABLE \
	CONFIG_NSS_DRV_IPV6_REASM_ENABLE \
	CONFIG_NSS_DRV_L2TP_ENABLE \
	CONFIG_NSS_DRV_LAG_ENABLE \
	CONFIG_NSS_DRV_LSO_RX_ENABLE \
	CONFIG_NSS_DRV_MAPT_ENABLE \
	CONFIG_NSS_DRV_MATCH_ENABLE \
	CONFIG_NSS_DRV_MIRROR_ENABLE \
	CONFIG_NSS_DRV_PPPOE_ENABLE \
	CONFIG_NSS_DRV_PPTP_ENABLE \
	CONFIG_NSS_DRV_QRFS_ENABLE \
	CONFIG_NSS_DRV_RMNET_ENABLE \
	CONFIG_NSS_DRV_SHAPER_ENABLE \
	CONFIG_NSS_DRV_SJACK_ENABLE \
	CONFIG_NSS_DRV_TRUSTSEC_ENABLE \
	CONFIG_NSS_DRV_TRUSTSEC_RX_ENABLE \
	CONFIG_NSS_DRV_TUN6RD_ENABLE \
	CONFIG_NSS_DRV_TUNIPIP6_ENABLE \
	CONFIG_NSS_DRV_UDP_ST_ENABLE \
	CONFIG_NSS_DRV_VIRT_IF_ENABLE \
	CONFIG_NSS_DRV_VLAN_ENABLE \
	CONFIG_NSS_DRV_VXLAN_ENABLE \
	CONFIG_NSS_DRV_WIFI_EXT_VDEV_ENABLE \
	CONFIG_NSS_DRV_WIFI_MESH_ENABLE \
	CONFIG_NSS_DRV_WIFIOFFLOAD_ENABLE \
	CONFIG_PACKAGE_kmod-qca-nss-crypto \
	CONFIG_PACKAGE_kmod-qca-nss-drv-bridge-mgr \
	CONFIG_PACKAGE_kmod-qca-nss-drv-eogremgr \
	CONFIG_PACKAGE_kmod-qca-nss-drv-gre \
	CONFIG_PACKAGE_kmod-qca-nss-drv-igs \
	CONFIG_PACKAGE_kmod-qca-nss-drv-l2tpv2 \
	CONFIG_PACKAGE_kmod-qca-nss-drv-lag-mgr \
	CONFIG_PACKAGE_kmod-qca-nss-drv-map-t \
	CONFIG_PACKAGE_kmod-qca-nss-drv-match \
	CONFIG_PACKAGE_kmod-qca-nss-drv-mirror \
	CONFIG_PACKAGE_kmod-qca-nss-drv-netlink \
	CONFIG_PACKAGE_kmod-qca-nss-drv-pppoe \
	CONFIG_PACKAGE_kmod-qca-nss-drv-pptp \
	CONFIG_PACKAGE_kmod-qca-nss-drv-qdisc \
	CONFIG_PACKAGE_kmod-qca-nss-drv-tun6rd \
	CONFIG_PACKAGE_kmod-qca-nss-drv-tunipip6 \
	CONFIG_PACKAGE_kmod-qca-nss-drv-vlan-mgr \
	CONFIG_PACKAGE_kmod-qca-nss-drv-vxlanmgr \
	CONFIG_PACKAGE_kmod-qca-nss-drv-wifi-meshmgr \
	CONFIG_PACKAGE_kmod-qca-nss-ecm \
	CONFIG_PACKAGE_kmod-gre \
	CONFIG_PACKAGE_kmod-gre6 \
	CONFIG_PACKAGE_kmod-ip6-tunnel \
	CONFIG_PACKAGE_kmod-iptunnel6 \
	CONFIG_PACKAGE_kmod-l2tp \
	CONFIG_PACKAGE_kmod-nat46 \
	CONFIG_PACKAGE_kmod-pppoe \
	CONFIG_PACKAGE_kmod-pptp \
	CONFIG_PACKAGE_kmod-sit \
	CONFIG_PACKAGE_kmod-vxlan

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/qca-nss-drv
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-dp \
	+nss-firmware \
	+@(PACKAGE_kmod-qca-nss-crypto):NSS_DRV_CRYPTO_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-bridge-mgr):NSS_DRV_BRIDGE_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-gre):NSS_DRV_GRE_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-igs):NSS_DRV_IGS_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-l2tpv2):NSS_DRV_L2TP_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-lag-mgr):NSS_DRV_LAG_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-map-t):NSS_DRV_MAPT_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-match):NSS_DRV_MATCH_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-match):NSS_DRV_WIFIOFFLOAD_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-mirror):NSS_DRV_MIRROR_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-netlink&&NSS_DRV_UDP_ST_ENABLE):NSS_DRV_RMNET_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-netlink&&PACKAGE_kmod-qca-nss-drv-gre):NSS_DRV_GRE_REDIR_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-netlink):NSS_DRV_IPV6_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-netlink):NSS_DRV_WIFIOFFLOAD_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-pppoe):NSS_DRV_PPPOE_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-pptp):NSS_DRV_PPTP_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-qdisc):NSS_DRV_SHAPER_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-tun6rd):NSS_DRV_TUN6RD_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-tunipip6):NSS_DRV_TUNIPIP6_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-vlan-mgr):NSS_DRV_VLAN_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-vxlanmgr):NSS_DRV_VXLAN_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-wifi-meshmgr):NSS_DRV_WIFI_EXT_VDEV_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-wifi-meshmgr):NSS_DRV_WIFI_MESH_ENABLE \
	+@(PACKAGE_kmod-qca-nss-drv-wifi-meshmgr):NSS_DRV_WIFIOFFLOAD_ENABLE \
	+@(PACKAGE_kmod-qca-nss-ecm&&PACKAGE_kmod-pppoe):NSS_DRV_PPPOE_ENABLE \
	+@(PACKAGE_kmod-qca-nss-ecm):NSS_DRV_IPV6_ENABLE \
	+@(PACKAGE_kmod-qca-nss-ecm):NSS_DRV_VIRT_IF_ENABLE
  TITLE:=Kernel driver for NSS (core driver)
  FILES:=$(PKG_BUILD_DIR)/qca-nss-drv.ko
  AUTOLOAD:=$(call AutoLoad,32,qca-nss-drv)
endef

define KernelPackage/qca-nss-drv/config
	source "$(SOURCE)/Config.in"
endef

define KernelPackage/qca-nss-drv/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/firmware
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/bin

	$(INSTALL_BIN) ./files/qca-nss-drv.debug $(1)/usr/bin/nss_stats
	$(INSTALL_BIN) ./files/qca-nss-drv.init $(1)/etc/init.d/qca-nss-drv
	$(INSTALL_BIN) ./files/skb_recycler.init $(1)/etc/init.d/skb_recycler
	$(INSTALL_DATA) ./files/qca-nss-drv.hotplug $(1)/etc/hotplug.d/firmware/10-qca-nss-fw
endef

define KernelPackage/qca-nss-drv/description
This package contains a NSS driver for QCA chipset
endef

NSS_DRV_SUBTARGET:=$(subst ",,$(CONFIG_TARGET_SUBTARGET))
SOC:=$(NSS_DRV_SUBTARGET)_64

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/qca-nss-drv
	$(CP) $(PKG_BUILD_DIR)/exports/* $(1)/usr/include/qca-nss-drv/
ifneq ($(filter $(NSS_DRV_SUBTARGET),ipq807x ipq60xx ipq50xx),)
	$(RM) $(1)/usr/include/qca-nss-drv/nss_ipsecmgr.h
endif
endef

NSS_DRV_INCLUDE_DIRS:= \
	$(STAGING_DIR)/usr/include/qca-nss-dp \
	$(STAGING_DIR)/usr/include/qca-ssdk

NSS_DRV_INCLUDES:=$(patsubst %,-I%,$(NSS_DRV_INCLUDE_DIRS))

EXTRA_CFLAGS += \
	$(NSS_DRV_INCLUDES) \
	-DNSS_FIRMWARE_VERSION_12_5 \
	-Wno-missing-declarations \
	-Wno-missing-prototypes \
	-Wno-empty-body \
	-Wno-unused-variable

DRV_MAKE_OPTS:=

# QSDK enables most NSS feature blocks unless the variable is explicitly "n".
# Keep unsupported or unpackaged common-path features disabled from this single
# OpenWrt package entry.
NSS_DRV_FORCE_DISABLED_FEATURES:= \
	C2C \
	CAPWAP \
	CLMAP \
	DTLS \
	IPSEC \
	PVXLAN \
	QVPN \
	TLS \
	WIFI_LEGACY

NSS_DRV_CONFIG_ONLY_FEATURES:= \
	GRE_REDIR \
	GRE_TUNNEL \
	IPV4_REASM \
	IPV6_REASM \
	LSO_RX \
	QRFS \
	RMNET \
	SJACK \
	TRUSTSEC \
	TRUSTSEC_RX \
	UDP_ST \
	WIFI_EXT_VDEV

define DisableNssDrvFeature
ifndef CONFIG_NSS_DRV_$(1)_ENABLE
DRV_MAKE_OPTS += NSS_DRV_$(1)_ENABLE=n
endif
endef

define DisableNssDrvFeatureWithoutPackages
ifeq ($(strip $(CONFIG_NSS_DRV_$(1)_ENABLE) $(foreach package,$(2),$(CONFIG_PACKAGE_$(package)))),)
DRV_MAKE_OPTS += NSS_DRV_$(1)_ENABLE=n
endif
endef

$(foreach feature,$(NSS_DRV_FORCE_DISABLED_FEATURES),$(eval DRV_MAKE_OPTS += NSS_DRV_$(feature)_ENABLE=n))
$(foreach feature,$(NSS_DRV_CONFIG_ONLY_FEATURES),$(eval $(call DisableNssDrvFeature,$(feature))))

$(eval $(call DisableNssDrvFeatureWithoutPackages,BRIDGE,kmod-qca-nss-drv-bridge-mgr))
$(eval $(call DisableNssDrvFeatureWithoutPackages,CRYPTO,kmod-qca-nss-crypto))
$(eval $(call DisableNssDrvFeatureWithoutPackages,GRE,kmod-qca-nss-drv-gre kmod-gre kmod-gre6))
$(eval $(call DisableNssDrvFeatureWithoutPackages,IGS,kmod-qca-nss-drv-igs))
$(eval $(call DisableNssDrvFeatureWithoutPackages,IPV6,kmod-qca-nss-drv-netlink kmod-qca-nss-ecm))
$(eval $(call DisableNssDrvFeatureWithoutPackages,L2TP,kmod-qca-nss-drv-l2tpv2 kmod-l2tp))
$(eval $(call DisableNssDrvFeatureWithoutPackages,LAG,kmod-qca-nss-drv-lag-mgr))
$(eval $(call DisableNssDrvFeatureWithoutPackages,MAPT,kmod-qca-nss-drv-map-t kmod-nat46))
$(eval $(call DisableNssDrvFeatureWithoutPackages,MATCH,kmod-qca-nss-drv-match))
$(eval $(call DisableNssDrvFeatureWithoutPackages,MIRROR,kmod-qca-nss-drv-mirror))
$(eval $(call DisableNssDrvFeatureWithoutPackages,PPPOE,kmod-qca-nss-drv-pppoe kmod-pppoe))
$(eval $(call DisableNssDrvFeatureWithoutPackages,PPTP,kmod-qca-nss-drv-pptp kmod-pptp))
$(eval $(call DisableNssDrvFeatureWithoutPackages,SHAPER,kmod-qca-nss-drv-qdisc))
$(eval $(call DisableNssDrvFeatureWithoutPackages,TUN6RD,kmod-qca-nss-drv-tun6rd kmod-sit))
$(eval $(call DisableNssDrvFeatureWithoutPackages,TUNIPIP6,kmod-qca-nss-drv-tunipip6 kmod-ip6-tunnel kmod-iptunnel6))
$(eval $(call DisableNssDrvFeatureWithoutPackages,VIRT_IF,kmod-qca-nss-ecm))
$(eval $(call DisableNssDrvFeatureWithoutPackages,VLAN,kmod-qca-nss-drv-vlan-mgr))
$(eval $(call DisableNssDrvFeatureWithoutPackages,VXLAN,kmod-qca-nss-drv-vxlanmgr kmod-vxlan))
$(eval $(call DisableNssDrvFeatureWithoutPackages,WIFI_MESH,kmod-qca-nss-drv-wifi-meshmgr))
$(eval $(call DisableNssDrvFeatureWithoutPackages,WIFIOFFLOAD,kmod-qca-nss-drv-match kmod-qca-nss-drv-netlink kmod-qca-nss-drv-wifi-meshmgr))

define Build/Configure
	$(LN) arch/nss_$(SOC).h $(PKG_BUILD_DIR)/exports/nss_arch.h
endef

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) $(strip $(DRV_MAKE_OPTS)) \
		M="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
		NSS_DRV_EXTRA_INCLUDES="$(NSS_DRV_INCLUDES)" \
		SoC=$(SOC) \
		modules
endef

$(eval $(call KernelPackage,qca-nss-drv))
