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

# Modify default IP —— Lean
# sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/luci2/bin/config_generate

# 修改immortalwrt.lan关联IP
# sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.123.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")

# 最大连接数修改为65535
sed -i '$a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 修改内核
# sed -i "s/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g" target/linux/ramips/Makefile

# luci-app-msd_lite
# rm -rf feeds/packages/net/msd_lite
# git clone --depth 1 https://github.com/immortalwrt/packages temp-packages-msd_lite
# cp -r temp-packages-msd_lite/net/msd_lite feeds/packages/net/
# rm -rf temp-packages-msd_lite
# rm -rf feeds/luci/applications/luci-app-msd_lite
# git clone https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
