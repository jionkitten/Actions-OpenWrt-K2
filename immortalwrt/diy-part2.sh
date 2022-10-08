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

git clone https://github.com/xiaorouji/openwrt-passwall2 package/openwrt-passwall2
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
CUR_PWD=$(pwd)

cd $CUR_PWD
cp files/passwall2.patch package/openwrt-passwall2
cd $CUR_PWD/package/openwrt-passwall2
git apply passwall2.patch

cp files/scutclient.patch package/feeds/luci/luci-app-scutclient/
cd $CUR_PWD/package/feeds/luci/luci-app-scutclient
patch -p1 <scutclient.patch

cd $CUR_PWD
cp files/mosdns.patch package/feeds/mosdns/luci-app-mosdns
cd $CUR_PWD/package/feeds/mosdns/luci-app-mosdns
git apply mosdns.patch

cd $CUR_PWD
cp files/zerotier.patch package/feeds/luci/luci-app-zerotier
cd $CUR_PWD/package/feeds/luci/luci-app-zerotier
git apply zerotier.patch

cd $CUR_PWD
mkdir -p package/xray-geodata
cp files/xray-geodata/Makefile package/xray-geodata

cd $CUR_PWD
rm files -rf
