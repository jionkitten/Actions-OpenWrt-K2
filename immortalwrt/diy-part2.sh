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

git clone https://github.com/thinktip/luci-theme-neobird package/feeds/luci/luci-theme-neobird
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
CUR_PWD=$(pwd)

cp files/scutclient.patch package/feeds/luci/luci-app-scutclient/
cd $CUR_PWD/package/feeds/luci/luci-app-scutclient
patch -p1 <scutclient.patch

cd $CUR_PWD
cp files/mosdns.patch package/feeds/mosdns/luci-app-mosdns
cd $CUR_PWD/package/feeds/mosdns/luci-app-mosdns
git apply mosdns.patch

cd $CUR_PWD
mkdir -p package/xray-geodata
cp files/xray-geodata/Makefile package/xray-geodata

cd $CUR_PWD
rm files -rf
