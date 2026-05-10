include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-athena-led
PKG_VERSION:=2.2.4
PKG_RELEASE:=1

PKG_MAINTAINER:=unraveloop <https://github.com/unraveloop>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE:=athena-led-aarch64-unknown-linux-musl-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/unraveloop/JDC-AX6600-Athena-LED-Controller/releases/download/v$(PKG_VERSION)/
PKG_HASH:=skip

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI Support for Athena LED (Animation Engine)
	DEPENDS:=+lua +luci-base @(aarch64||arm)
	PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
Enhanced LuCI support for JDCloud AX6600 (Athena) LED Screen Control.
v2.2.x Epic Animation Update:
- 🎬 Bad Apple & Custom Animation Engine (0% CPU cost).
- 📂 Auto-scan preset animations in LuCI.
- Single/Multi-profile seamless switching via physical button.
- Hardware LED state locking.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./luasrc $(PKG_BUILD_DIR)/
	$(CP) ./root $(PKG_BUILD_DIR)/
	$(CP) ./po $(PKG_BUILD_DIR)/
endef

define Build/Compile
	# 如果存在中文语言包目录，则编译为 .lmo 格式
	[ -d ./po/zh_Hans ] && po2lmo ./po/zh_Hans/athena_led.po $(PKG_BUILD_DIR)/zh_Hans.lmo || true
endef

define Package/$(PKG_NAME)/install
	# 1. 安装 LuCI 界面源码 (从编译目录拷贝)
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/

	# 2. 安装 init.d 守护脚本
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/root/etc/init.d/athena_led $(1)/etc/init.d/

	# 3. 安装 UCI 配置文件
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/root/etc/config/athena_led $(1)/etc/config/

	# 4. 安装 Rust 核心二进制程序
	$(INSTALL_DIR) $(1)/usr/bin
	# 先从下载目录解压到编译目录
	tar xf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/athena-led $(1)/usr/bin/

	# 🌟 5. 安装预置的动画文件 (.bin)
	$(INSTALL_DIR) $(1)/etc/athena_led/anim
	$(CP) $(PKG_BUILD_DIR)/root/etc/athena_led/anim/*.bin $(1)/etc/athena_led/anim/ 2>/dev/null || true

	# 6. 安装物理按键探测脚本 (同时去掉 .sh 后缀，提升命令逼格)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/root/usr/bin/find_button.sh $(1)/usr/bin/find_button

# 7. 安装 i18n 语言包 (双后缀通杀版)
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	[ -f $(PKG_BUILD_DIR)/zh_Hans.lmo ] && { \
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/zh_Hans.lmo $(1)/usr/lib/lua/luci/i18n/athena_led.zh-cn.lmo; \
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/zh_Hans.lmo $(1)/usr/lib/lua/luci/i18n/athena_led.zh_Hans.lmo; \
	} || true
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -f /etc/config/athena_led.apk-new ]; then
		mv /etc/config/athena_led /etc/config/athena_led.v1_bak 2>/dev/null
		mv /etc/config/athena_led.apk-new /etc/config/athena_led
	fi
	if [ -f /etc/config/athena_led-opkg ]; then
		mv /etc/config/athena_led /etc/config/athena_led.v1_bak 2>/dev/null
		mv /etc/config/athena_led-opkg /etc/config/athena_led
	fi
	rm -rf /tmp/luci-indexcache /tmp/luci-modulecache/* 2>/dev/null
	/etc/init.d/athena_led restart >/dev/null 2>&1
fi
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))