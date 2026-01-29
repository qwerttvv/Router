#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 修改immortalwrt.lan关联IP
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.123.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")

# 最大连接数修改为131072
sed -i '$a net.netfilter.nf_conntrack_max = 131072' package/base-files/files/etc/sysctl.conf
# 优化其他网络参数
sed -i '$a net.core.default_qdisc = fq' package/base-files/files/etc/sysctl.conf
sed -i '$a net.ipv4.tcp_congestion_control = bbr' package/base-files/files/etc/sysctl.conf
sed -i '$a net.ipv4.tcp_fastopen = 3' package/base-files/files/etc/sysctl.conf
sed -i '$a net.ipv4.tcp_mtu_probing = 1' package/base-files/files/etc/sysctl.conf
sed -i '$a net.core.somaxconn = 8192' package/base-files/files/etc/sysctl.conf
sed -i '$a net.core.netdev_max_backlog = 4096' package/base-files/files/etc/sysctl.conf
sed -i '$a net.core.optmem_max = 524288' package/base-files/files/etc/sysctl.conf
sed -i '$a net.core.rmem_default = 524288' package/base-files/files/etc/sysctl.conf
sed -i '$a net.core.wmem_default = 524288' package/base-files/files/etc/sysctl.conf
sed -i '$a net.core.rmem_max = 16777216' package/base-files/files/etc/sysctl.conf
sed -i '$a net.core.wmem_max = 16777216' package/base-files/files/etc/sysctl.conf
sed -i '$a net.ipv4.tcp_rmem = 4096 524288 16777216' package/base-files/files/etc/sysctl.conf
sed -i '$a net.ipv4.tcp_wmem = 4096 524288 16777216' package/base-files/files/etc/sysctl.conf
# 针对1G内存设备的网络优化
sed -i '$a net.ipv4.tcp_mem = 32768 57344 81920' package/base-files/files/etc/sysctl.conf
sed -i '$a net.ipv4.udp_mem = 24576 32768 49152' package/base-files/files/etc/sysctl.conf

# 无WIFI配置调整Q6大小
find ./target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ -type f ! -iname '*nowifi*' -exec sed -i 's/ipq\(6018\|8074\).dtsi/ipq\1-nowifi.dtsi/g' {} +
# 无WIFI配置调整Q6大小——进一步缩小到12MB
sed -i 's/0x4ab00000 0x0 0x1000000/0x4ab00000 0x0 0xC00000/g' ./target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq6018-nowifi.dtsi

# omcproxy
# sed -i '/^PKG_NAME:=omcproxy/a PKG_VERSION:=9.9.9' package/network/services/omcproxy/Makefile
# sed -i 's|^PKG_SOURCE_URL.*|PKG_SOURCE_URL=https://github.com/qwerttvv/Router.git|g' package/network/services/omcproxy/Makefile
# sed -i 's|^PKG_MIRROR_HASH.*|PKG_HASH:=skip|g' package/network/services/omcproxy/Makefile
# sed -i 's|^PKG_SOURCE_VERSION.*|PKG_SOURCE_VERSION:=omcproxy|g' package/network/services/omcproxy/Makefile

sed -i 's|^PKG_MIRROR_HASH.*|PKG_HASH:=skip|g' package/network/services/omcproxy/Makefile
sed -i 's|^PKG_SOURCE_VERSION.*|PKG_SOURCE_VERSION:=997a981ae3757401764627ff57b15cb5c69aab69|g' package/network/services/omcproxy/Makefile

# Modify banner
sed -i 's|https://openwrt.org/docs/guide-user/additional-software/opkg-to-apk-cheatsheet|https://openwrt.org/docs/guide-user/additional-software/opkg-to-apk-cheatsheet\n\napk --no-cache --no-network add --allow-untrusted /tmp/tmp/*.apk|' package/base-files/files/etc/profile.d/apk-cheatsheet.sh
