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

CUR_PWD=$(pwd)
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
git clone https://github.com/thinktip/luci-theme-neobird package/feeds/luci/luci-theme-neobird
git clone https://github.com/jerrykuku/luci-theme-argon package/feeds/luci/luci-theme-argon
git clone https://github.com/tty228/luci-app-serverchan package/feeds/luci/luci-app-serverchan
git clone https://github.com/scutclient/luci-app-scutclient package/feeds/luci/luci-app-scutclient
git clone https://github.com/scutclient/scutclient package/scutclient
#git clone https://github.com/WYC-2020/openwrt-subconverter package/subconverter

cp files/scutclient.patch package/feeds/luci/luci-app-scutclient/
cp files/xwrt-luci.patch feeds/luci/

cd $CUR_PWD/package/feeds/luci/luci-app-scutclient
git apply scutclient.patch

cd $CUR_PWD/feeds/luci
git apply xwrt-luci.patch

cd $CUR_PWD
mkdir -p package/mosdns
mkdir -p package/mosdns/files
cp files/mosdns/Makefile package/mosdns
cp files/mosdns/config.yaml package/mosdns/files
