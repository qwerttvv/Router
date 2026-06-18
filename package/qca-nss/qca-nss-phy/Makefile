include $(TOPDIR)/rules.mk

PKG_NAME:=qca-nss-phy
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://git.codelinaro.org/clo/qsdk/oss/lklm/qca-nss-phy.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2026-01-11
PKG_SOURCE_VERSION:=85cb19ff9c3905851b5452c7558cc3d94261be4f
PKG_MIRROR_HASH:=26f29e2f40c83b2bf836def858d3278eb02909439e5a40631dd238facf352fa7

PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Package/qca-nss-phy
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  TITLE:=Qualcomm NSS PHY headers
  URL:=https://git.codelinaro.org/clo/qsdk/oss/lklm/qca-nss-phy
  DEPENDS:=@TARGET_qualcommax
  BUILDONLY:=1
endef

define Package/qca-nss-phy/description
  Build-only package exporting QSDK NSS PHY headers for SSDK consumers.
endef

define Build/Compile
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/qca-nss-phy
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/nss_ext/*.h $(1)/usr/include/qca-nss-phy/
endef

$(eval $(call BuildPackage,qca-nss-phy))
