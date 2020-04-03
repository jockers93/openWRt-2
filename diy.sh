#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/10.10.10.10/g' package/base-files/files/bin/config_generate
sed -i '1c net.netfilter.nf_conntrack_max=160000' package/base-files/files/etc/sysctl.conf
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
rm -rf package/lean/luci-theme-argon
# 添加第三方软件包
git clone https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone https://github.com/Leo-Jo-My/luci-app-vssr package/luci-app-vssr
git clone https://github.com/Leo-Jo-My/my package/my
git clone https://github.com/Lienol/openwrt-package package/openwrt-package
git clone https://github.com/lisaac/luci-app-dockerman package/luci-app-dockerman
git clone https://github.com/lisaac/luci-app-diskman package/luci-app-diskman
mkdir -p package/luci-lib-docker && wget https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile -O package/luci-lib-docker/Makefile
mkdir -p package/luci-app-dockerman && wget https://raw.githubusercontent.com/lisaac/luci-app-dockerman/master/Makefile -O package/luci-app-dockerman/Makefile
mkdir -p package/luci-app-diskman && wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted && wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/vernesong/OpenClash package/OpenClash
git clone https://github.com/Kiougar/luci-wrtbwmon package/luci-wrtbwmon
git clone https://github.com/Leo-Jo-My/luci-theme-opentomato package/luci-theme-opentomato
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat package/luci-theme-opentomcat
./scripts/feeds update -a
./scripts/feeds install -a
# 删除所有空格 密码 添加权限+1  分区剩余空间
# sed -i '/^$/d' /package/lean/default-settings/files/zzz-default-settings
# sed -i '/shadow/d' /package/lean/default-settings/files/zzz-default-settings
sed -i '$i chmod +x /etc/config/speedtest.py' package/lean/default-settings/files/zzz-default-settings
#chmod 777 /mnt/
#chmod 777 /mnt/sda3
#/etc/docker-init
