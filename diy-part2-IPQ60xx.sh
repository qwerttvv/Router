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

# 最大连接数修改为65535
# sed -i '$a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 无WIFI配置调整Q6大小
find ./target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ -type f ! -iname '*nowifi*' -exec sed -i 's/ipq\(6018\|8074\)\.dtsi/ipq\1-nowifi.dtsi/g' {} +

# 无WIFI配置调整Q6大小——进一步缩小到8MB
sed -i 's/0x1000000/0x800000/g' ./target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq6018-nowifi.dtsi

# omcproxy
sed -i 's|^PKG_SOURCE_URL.*|PKG_SOURCE_URL=https://github.com/qwerttvv/Router.git|g' package/network/services/omcproxy/Makefile
sed -i 's|^PKG_MIRROR_HASH.*|PKG_MIRROR_HASH:=skip|g' package/network/services/omcproxy/Makefile
sed -i 's|^PKG_SOURCE_VERSION.*|PKG_SOURCE_VERSION:=omcproxy|g' package/network/services/omcproxy/Makefile

