#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git helloworld https://github.com/sbwml/openwrt_helloworld' >>feeds.conf.default

# sed -i 's|src-git packages https://github.com/immortalwrt/packages.git|src-git packages https://github.com/immortalwrt/packages.git^bd797811a812be7b85bf03a0e63c2a2e0d178e44|g' feeds.conf.default
