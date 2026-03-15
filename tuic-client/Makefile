# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2020 Yousong Zhou <yszhou4tech@gmail.com>
# Copyright (C) 2021 ImmortalWrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=tuic-client
PKG_VERSION:=1.7.1
PKG_RELEASE:=1

PKG_SOURCE:=tuic-client-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Itsusinn/tuic/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=f07f717e75c0e2ad0a67ade71a4b396639b706da7412b808b33987b30525a51a

PKG_BUILD_DIR:=$(BUILD_DIR)/tuic-$(PKG_VERSION)

PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Tianling Shen <cnsztl@immortalwrt.org>

PKG_BUILD_DEPENDS:=rust/host
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/rust/rust-package.mk

define Package/tuic-client
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Delicately-TUICed 0-RTT proxy protocol (client)
  DEPENDS:=$(RUST_ARCH_DEPENDS)
  URL:=https://github.com/Itsusinn/tuic/
endef

define Build/Compile
	$(call Build/Compile/Cargo,tuic-client)
endef

define Package/tuic-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/tuic-client $(1)/usr/bin/tuic-client
endef

$(eval $(call BuildPackage,tuic-client))
