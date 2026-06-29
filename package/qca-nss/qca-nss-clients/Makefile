include $(TOPDIR)/rules.mk

PKG_NAME:=qca-nss-clients
PKG_RELEASE:=13

PKG_SOURCE_URL:=https://git.codelinaro.org/clo/qsdk/oss/lklm/nss-clients.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-09-12
PKG_SOURCE_VERSION:=51be82d
PKG_MIRROR_HASH:=d848f96ad8ee14697402cbe1f664e996fb9777974abea795d485779161f3804b
QSDK_VERSION:=12.5.5
PKG_VERSION:=$(QSDK_VERSION).$(subst -,.,$(PKG_SOURCE_DATE))~$(PKG_SOURCE_VERSION)

PKG_BUILD_PARALLEL:=1

PKG_CONFIG_DEPENDS:= \
	CONFIG_TARGET_SUBTARGET \
	CONFIG_NSS_DRV_BRIDGE_ENABLE \
	CONFIG_NSS_DRV_GRE_ENABLE \
	CONFIG_NSS_DRV_GRE_REDIR_ENABLE \
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
	CONFIG_NSS_DRV_TUN6RD_ENABLE \
	CONFIG_NSS_DRV_TUNIPIP6_ENABLE \
	CONFIG_NSS_DRV_UDP_ST_ENABLE \
	CONFIG_NSS_DRV_VLAN_ENABLE \
	CONFIG_NSS_DRV_VXLAN_ENABLE \
	CONFIG_NSS_DRV_WIFI_MESH_ENABLE \
	CONFIG_NSS_DRV_WIFIOFFLOAD_ENABLE \
	CONFIG_NSS_NLGRE_REDIR_ENABLE \
	CONFIG_NSS_NLLSO_RX \
	CONFIG_NSS_NLQRFS_ENABLE \
	CONFIG_NSS_NLUDP_ST_ENABLE \
	CONFIG_ATH11K_NSS_SUPPORT \
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
	CONFIG_PACKAGE_kmod-qca-ovsmgr

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

NSS_CLIENTS_SUBTARGET:=$(subst ",,$(CONFIG_TARGET_SUBTARGET))
SOC:=$(NSS_CLIENTS_SUBTARGET)_64

define KernelPackage/qca-nss-drv-bridge-mgr
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=Kernel driver for NSS bridge manager
  DEPENDS:=@(TARGET_qualcommax_ipq807x||TARGET_qualcommax_ipq60xx) \
	+kmod-qca-nss-drv \
	+kmod-qca-nss-drv-vlan-mgr \
	+kmod-bonding
ifneq ($(CONFIG_PACKAGE_kmod-qca-ovsmgr),)
  DEPENDS += +kmod-qca-ovsmgr
endif
  FILES:=$(PKG_BUILD_DIR)/bridge/qca-nss-bridge-mgr.ko
  AUTOLOAD:=$(call AutoLoad,51,qca-nss-bridge-mgr)
endef

define KernelPackage/qca-nss-drv-bridge-mgr/description
Kernel modules for NSS bridge manager
endef

define KernelPackage/qca-nss-drv-eogremgr
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS EOGRE manager for QCA NSS driver
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-qca-nss-drv-gre
  FILES:=$(PKG_BUILD_DIR)/eogremgr/qca-nss-eogremgr.ko
endef

define KernelPackage/qca-nss-drv-eogremgr/description
Kernel module for managing NSS EoGRE
endef

define KernelPackage/qca-nss-drv-gre
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS connection manager for GRE protocol
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-gre6
  FILES:=$(PKG_BUILD_DIR)/gre/qca-nss-gre.ko $(PKG_BUILD_DIR)/gre/test/qca-nss-gre-test.ko
  AUTOLOAD:=$(call AutoLoad,52,qca-nss-gre)
endef

define KernelPackage/qca-nss-drv-gre/description
Kernel modules for NSS connection manager - Support for GRE
endef

define KernelPackage/qca-nss-drv-igs
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS connection manager to perform ingress shaping
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-qca-nss-drv-qdisc \
	+kmod-ifb \
	+kmod-nf-conntrack \
	+kmod-sched-core
  FILES:=$(PKG_BUILD_DIR)/nss_qdisc/igs/act_nssmirred.ko
endef

define KernelPackage/qca-nss-drv-igs/description
Linux action that helps in offloading traffic to an IFB interface to perform ingress shaping.
endef

define KernelPackage/qca-nss-drv-l2tpv2
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS connection manager for L2TPv2 protocol
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-l2tp \
	+kmod-ppp
  FILES:=$(PKG_BUILD_DIR)/l2tp/l2tpv2/qca-nss-l2tpv2.ko
  KCONFIG:=CONFIG_L2TP=y
  AUTOLOAD:=$(call AutoLoad,53,qca-nss-l2tpv2)
endef

define KernelPackage/qca-nss-drv-l2tpv2/description
Kernel modules for NSS connection manager - Support for l2tp tunnel
endef

define KernelPackage/qca-nss-drv-lag-mgr
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS LAG (link aggregation) manager
  DEPENDS:=@(TARGET_qualcommax_ipq807x||TARGET_qualcommax_ipq60xx) \
	+kmod-qca-nss-drv \
	+kmod-qca-nss-drv-vlan-mgr \
	+kmod-bonding
  FILES:=$(PKG_BUILD_DIR)/lag/qca-nss-lag-mgr.ko
  AUTOLOAD:=$(call AutoLoad,51,qca-nss-lag-mgr)
endef

define KernelPackage/qca-nss-drv-lag-mgr/description
Kernel modules for NSS LAG manager
endef

define KernelPackage/qca-nss-drv-map-t
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS connection manager for MAP-T protocol
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-nat46
  FILES:=$(PKG_BUILD_DIR)/map/map-t/qca-nss-map-t.ko
  AUTOLOAD:=$(call AutoLoad,60,qca-nss-map-t)
endef

define KernelPackage/qca-nss-drv-map-t/description
Kernel modules for NSS connection manager - Support for MAP-T
endef

define KernelPackage/qca-nss-drv-match
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS Match for QCA NSS driver
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv
  FILES:=$(PKG_BUILD_DIR)/match/qca-nss-match.ko
endef

define KernelPackage/qca-nss-drv-match/description
Kernel module for managing NSS Match
endef

define KernelPackage/qca-nss-drv-mirror
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=Module for mirroring packets from NSS to host
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv
  FILES:=$(PKG_BUILD_DIR)/mirror/qca-nss-mirror.ko
endef

define KernelPackage/qca-nss-drv-mirror/description
Kernel module for managing NSS Mirror
endef

define KernelPackage/qca-nss-drv-pppoe
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS connection manager for PPPoE protocol
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-bonding \
	+kmod-ppp \
	+kmod-pppoe
  FILES:=$(PKG_BUILD_DIR)/pppoe/qca-nss-pppoe.ko
  AUTOLOAD:=$(call AutoLoad,53,qca-nss-pppoe)
endef

define KernelPackage/qca-nss-drv-pppoe/description
Kernel modules for NSS connection manager - Support for PPPoE
endef

define KernelPackage/qca-nss-drv-pptp
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS connection manager for PPTP protocol
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-pptp
  FILES:=$(PKG_BUILD_DIR)/pptp/qca-nss-pptp.ko
  AUTOLOAD:=$(call AutoLoad,53,qca-nss-pptp)
endef

define KernelPackage/qca-nss-drv-pptp/description
Kernel modules for NSS connection manager - Support for PPTP tunnel
endef

define KernelPackage/qca-nss-drv-qdisc
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=Qdisc for configuring shapers in NSS
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-qca-nss-drv-bridge-mgr
  FILES:=$(PKG_BUILD_DIR)/nss_qdisc/qca-nss-qdisc.ko
  KCONFIG:=CONFIG_NET_CLS_ACT=y
endef

define KernelPackage/qca-nss-drv-qdisc/description
Linux qdisc that aids in configuring shapers in the NSS
endef

define KernelPackage/qca-nss-drv-tun6rd
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS connection manager for 6rd tunnels
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+6rd \
	+kmod-sit
  FILES:=$(PKG_BUILD_DIR)/qca-nss-tun6rd.ko
  AUTOLOAD:=$(call AutoLoad,60,qca-nss-tun6rd)
endef

define KernelPackage/qca-nss-drv-tun6rd/description
Kernel modules for NSS connection manager - Support for 6rd tunnel
endef

define KernelPackage/qca-nss-drv-tunipip6
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS connection manager for IPIP6 tunnels
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-ip6-tunnel \
	+kmod-iptunnel6
  FILES:=$(PKG_BUILD_DIR)/tunipip6/qca-nss-tunipip6.ko
  AUTOLOAD:=$(call AutoLoad,60,qca-nss-tunipip6)
endef

define KernelPackage/qca-nss-drv-tunipip6/description
Kernel modules for NSS connection manager
Add support for DS-lite and ipip6 tunnel
endef

define KernelPackage/qca-nss-drv-vlan-mgr
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=Kernel driver for NSS vlan manager
  DEPENDS:=@(TARGET_qualcommax_ipq807x||TARGET_qualcommax_ipq60xx) \
	+kmod-qca-nss-drv \
	+kmod-bonding
  FILES:=$(PKG_BUILD_DIR)/vlan/qca-nss-vlan.ko
  AUTOLOAD:=$(call AutoLoad,50,qca-nss-vlan)
endef

define KernelPackage/qca-nss-drv-vlan-mgr/description
Kernel modules for NSS vlan manager
endef

define KernelPackage/qca-nss-drv-vxlanmgr
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS VxLAN manager for QCA NSS driver
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+kmod-vxlan
  FILES:=$(PKG_BUILD_DIR)/vxlanmgr/qca-nss-vxlanmgr.ko
  AUTOLOAD:=$(call AutoLoad,52,qca-nss-vxlanmgr)
endef

define KernelPackage/qca-nss-drv-vxlanmgr/description
Kernel module for managing NSS VxLAN
endef

define KernelPackage/qca-nss-drv-wifi-meshmgr
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS WiFi-Mesh manager for QCA NSS driver
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv
  FILES:=$(PKG_BUILD_DIR)/wifi_meshmgr/qca-nss-wifi-meshmgr.ko
ifneq ($(CONFIG_ATH11K_NSS_SUPPORT),)
  AUTOLOAD:=$(call AutoLoad,52,qca-nss-wifi-meshmgr)
endif
endef

define KernelPackage/qca-nss-drv-wifi-meshmgr/description
Kernel module for WiFi Mesh manager
endef

define KernelPackage/qca-nss-drv-netlink
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=NSS NETLINK manager for QCA NSS driver
  DEPENDS:=@TARGET_qualcommax \
	+kmod-qca-nss-drv \
	+PACKAGE_kmod-qca-nss-drv-gre:kmod-qca-nss-drv-gre \
	+PACKAGE_kmod-qca-nss-drv-igs:kmod-qca-nss-drv-igs \
	+PACKAGE_kmod-qca-nss-drv-l2tpv2:kmod-qca-nss-drv-l2tpv2 \
	+PACKAGE_kmod-qca-nss-drv-lag-mgr:kmod-qca-nss-drv-lag-mgr \
	+PACKAGE_kmod-qca-nss-drv-map-t:kmod-qca-nss-drv-map-t \
	+PACKAGE_kmod-qca-nss-drv-match:kmod-qca-nss-drv-match \
	+PACKAGE_kmod-qca-nss-drv-mirror:kmod-qca-nss-drv-mirror \
	+PACKAGE_kmod-qca-nss-drv-pppoe:kmod-qca-nss-drv-pppoe \
	+PACKAGE_kmod-qca-nss-drv-pptp:kmod-qca-nss-drv-pptp \
	+PACKAGE_kmod-qca-nss-drv-qdisc:kmod-qca-nss-drv-qdisc \
	+PACKAGE_kmod-qca-nss-drv-tun6rd:kmod-qca-nss-drv-tun6rd \
	+PACKAGE_kmod-qca-nss-drv-tunipip6:kmod-qca-nss-drv-tunipip6 \
	+PACKAGE_kmod-qca-nss-drv-vxlanmgr:kmod-qca-nss-drv-vxlanmgr
  FILES:=$(PKG_BUILD_DIR)/netlink/qca-nss-netlink.ko
endef

define KernelPackage/qca-nss-drv-netlink/config
	source "$(SOURCE)/Config.in"
endef

define KernelPackage/qca-nss-drv-netlink/description
Kernel module for NSS netlink manager
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/qca-nss-clients
	$(CP) $(PKG_BUILD_DIR)/netlink/include/* $(1)/usr/include/qca-nss-clients/
	$(CP) $(PKG_BUILD_DIR)/exports/* $(1)/usr/include/qca-nss-clients/
endef

define KernelPackage/qca-nss-drv-netlink/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/qca-nss-netlink.init $(1)/etc/init.d/qca-nss-netlink
endef

EXTRA_CFLAGS += \
	-I$(STAGING_DIR)/usr/include/qca-nss-drv \
	-I$(STAGING_DIR)/usr/include/qca-nss-ecm \
	-I$(STAGING_DIR)/usr/include/qca-ssdk \
	-I$(STAGING_DIR)/usr/include/qca-ssdk/fal \
	-I$(STAGING_DIR)/usr/include/nat46

NSS_CLIENTS_MAKE_OPTS:=

# Keep modules without OpenWrt packages/runtime integration explicitly disabled
# at the package boundary. Add a KernelPackage before removing an entry here.
NSS_CLIENTS_FORCE_DISABLED_MODULES:= \
	capwapmgr \
	clmapmgr \
	dtlsmgr \
	ipsecmgr \
	ipsecmgr-klips \
	ipsecmgr-xfrm \
	pvxlanmgr \
	tlsmgr

NSS_CLIENTS_UNPACKAGED_MODULES:= \
	mscs \
	ovpn-mgr \
	portifmgr \
	profile

NSS_CLIENTS_DISABLED_MODULES:= \
	$(NSS_CLIENTS_FORCE_DISABLED_MODULES) \
	$(NSS_CLIENTS_UNPACKAGED_MODULES)

NSS_CLIENTS_MAKE_OPTS += $(foreach module,$(NSS_CLIENTS_DISABLED_MODULES),$(module)=n)

define NssClientModule
ifneq ($$(CONFIG_PACKAGE_kmod-qca-nss-drv-$(1)),)
NSS_CLIENTS_MAKE_OPTS += $(2)=y
endif
endef

define NssNetlinkFamily
ifneq ($$(CONFIG_$(1)),)
NSS_CLIENTS_MAKE_OPTS += CONFIG_$(2)=y
endif
endef

ifneq ($(CONFIG_PACKAGE_kmod-qca-nss-drv-tun6rd),)
NSS_CLIENTS_MAKE_OPTS += tun6rd=m
endif

ifneq ($(CONFIG_PACKAGE_kmod-qca-nss-drv-l2tpv2),)
EXTRA_CFLAGS += -DNSS_L2TPV2_ENABLED
endif

$(eval $(call NssClientModule,l2tpv2,l2tpv2))
$(eval $(call NssNetlinkFamily,PACKAGE_kmod-qca-nss-drv-l2tpv2,NSS_NLL2TPV2))
$(eval $(call NssClientModule,pptp,pptp))
$(eval $(call NssNetlinkFamily,PACKAGE_kmod-qca-nss-drv-pptp,NSS_NLPPTP))
$(eval $(call NssClientModule,map-t,map-t))
$(eval $(call NssNetlinkFamily,PACKAGE_kmod-qca-nss-drv-map-t,NSS_NLMAP_T))
$(eval $(call NssClientModule,tunipip6,tunipip6))
$(eval $(call NssClientModule,qdisc,qdisc))
$(eval $(call NssClientModule,igs,igs))

ifneq ($(CONFIG_PACKAGE_kmod-qca-nss-drv-bridge-mgr),)
NSS_CLIENTS_MAKE_OPTS += bridge-mgr=y
ifneq ($(CONFIG_PACKAGE_kmod-qca-ovsmgr),)
NSS_CLIENTS_MAKE_OPTS += NSS_BRIDGE_MGR_OVS_ENABLE=y
EXTRA_CFLAGS += -I$(STAGING_DIR)/usr/include/qca-ovsmgr
endif
endif

$(eval $(call NssClientModule,vlan-mgr,vlan-mgr))
$(eval $(call NssClientModule,lag-mgr,lag-mgr))

ifneq ($(CONFIG_PACKAGE_kmod-qca-nss-drv-gre),)
EXTRA_CFLAGS += -I$(PKG_BUILD_DIR)/exports
NSS_CLIENTS_MAKE_OPTS += gre=y
endif

$(eval $(call NssClientModule,pppoe,pppoe))
$(eval $(call NssNetlinkFamily,PACKAGE_kmod-qca-nss-drv-pppoe,NSS_NLPPPOE))

ifneq ($(CONFIG_PACKAGE_kmod-qca-nss-drv-netlink),)
NSS_CLIENTS_MAKE_OPTS += netlink=y

$(eval $(call NssNetlinkFamily,NSS_DRV_IPV4_REASM_ENABLE,NSS_NLIPV4_REASM))
$(eval $(call NssNetlinkFamily,NSS_DRV_IPV6_REASM_ENABLE,NSS_NLIPV6_REASM))
$(eval $(call NssNetlinkFamily,NSS_DRV_WIFIOFFLOAD_ENABLE,NSS_NLWIFILI))
$(eval $(call NssNetlinkFamily,NSS_NLGRE_REDIR_ENABLE,NSS_NLGRE_REDIR_FAMILY))
$(eval $(call NssNetlinkFamily,NSS_NLLSO_RX,NSS_NLLSO_RX))
$(eval $(call NssNetlinkFamily,NSS_NLQRFS_ENABLE,NSS_NLQRFS))
$(eval $(call NssNetlinkFamily,NSS_NLUDP_ST_ENABLE,NSS_NLUDP_ST))

endif

$(eval $(call NssClientModule,eogremgr,eogremgr))

ifneq ($(CONFIG_PACKAGE_kmod-qca-nss-drv-vxlanmgr),)
NSS_CLIENTS_MAKE_OPTS += vxlanmgr=y
EXTRA_CFLAGS += -DNSS_VXLAN_ENABLED
endif

$(eval $(call NssClientModule,match,match))
$(eval $(call NssClientModule,mirror,mirror))
$(eval $(call NssClientModule,wifi-meshmgr,wifi-meshmgr))

EXTRA_CFLAGS += \
	-Wno-missing-prototypes \
	-Wno-missing-declarations \
	-Wno-empty-body

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) $(strip $(NSS_CLIENTS_MAKE_OPTS)) \
		M="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
		SoC=$(SOC) \
		modules
endef

NSS_CLIENT_PACKAGES:= \
	qca-nss-drv-bridge-mgr \
	qca-nss-drv-eogremgr \
	qca-nss-drv-gre \
	qca-nss-drv-igs \
	qca-nss-drv-l2tpv2 \
	qca-nss-drv-lag-mgr \
	qca-nss-drv-map-t \
	qca-nss-drv-match \
	qca-nss-drv-mirror \
	qca-nss-drv-netlink \
	qca-nss-drv-pppoe \
	qca-nss-drv-pptp \
	qca-nss-drv-qdisc \
	qca-nss-drv-tun6rd \
	qca-nss-drv-tunipip6 \
	qca-nss-drv-vlan-mgr \
	qca-nss-drv-vxlanmgr \
	qca-nss-drv-wifi-meshmgr

$(foreach package,$(NSS_CLIENT_PACKAGES),$(eval $(call KernelPackage,$(package))))
