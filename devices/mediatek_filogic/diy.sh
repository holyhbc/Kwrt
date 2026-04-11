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

# ========== 强制指定 360T7 为唯一编译设备 ==========
echo "=== Forcing 360T7 as the only device ==="

# 1. 禁用所有其他设备
sed -i '/CONFIG_TARGET_mediatek_filogic_DEVICE_/s/=y/=n/g' .config

# 2. 启用 360T7
echo 'CONFIG_TARGET_mediatek_filogic_DEVICE_qihoo_360t7=y' >> .config

# 3. 确保禁用多设备编译
sed -i 's/CONFIG_TARGET_MULTI_PROFILE=y/CONFIG_TARGET_MULTI_PROFILE=n/g' .config
echo 'CONFIG_TARGET_ALL_PROFILES=n' >> .config

# 4. 重新运行 defconfig 让配置生效
make defconfig

# 5. 验证结果
echo "=== Selected device(s) ==="
grep "CONFIG_TARGET_mediatek_filogic_DEVICE_.*=y" .config
echo "=========================="
