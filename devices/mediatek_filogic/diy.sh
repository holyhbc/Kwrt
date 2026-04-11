#!/bin/bash

# Fix perf compile error
if [ -f .config ]; then
    sed -i '/CONFIG_PACKAGE_perf/d' .config
    sed -i '/CONFIG_DEVEL_PERF/d' .config
    echo 'CONFIG_PACKAGE_perf=n' >> .config
    echo 'CONFIG_DEVEL_PERF=n' >> .config
fi
rm -rf package/devel/perf
mkdir -p package/devel/perf
touch package/devel/perf/.built


shopt -s extglob
SHELL_FOLDER=$(dirname $(readlink -f "$0"))

#bash $SHELL_FOLDER/../common/kernel_6.6.sh

sed -i -E -e 's/ ?root=\/dev\/fit0 rootwait//' -e "/rootdisk =/d" -e '/bootargs.* = ""/d' target/linux/mediatek/dts/*{qihoo-360t7,netcore-n60,h3c-magic-nx30-pro,jdcloud-re-cp-03,cmcc-rax3000m,jcg-q30-pro,tplink-tl-xdr*}.dts

find target/linux/mediatek/filogic/base-files/ -type f -exec sed -i "s/-stock//g" {} \;
find target/linux/mediatek/base-files/ -type f -exec sed -i "s/-stock//g" {} \;

sed -i "s/-stock//g" package/boot/uboot-envtools/files/mediatek_filogic

sed -i "s/openwrt-mediatek-filogic/kwrt-mediatek-filogic/g" target/linux/mediatek/image/filogic.mk
sed -i "s/ fitblk / /g" target/linux/mediatek/image/filogic.mk

