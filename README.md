# Kwrt Package Repository

| 项目 | 信息 |
|------|------|
| 最后更新 | Thu Apr 16 09:21:06 UTC 2026 |
| 版本号 | 04.16 |
| 提交ID | e4fde4546b1fafc650343bac15cdb386b429a6a6 |
| 固件设备 | mediatek_filogic |
| 内核版本 | 6.6.133 |

## 使用方法

在路由器的 `/etc/opkg/customfeeds.conf` 中添加：

```
src/gz kwrt_core https://holyhbc.github.io/Kwrt/releases/04.16/targets/mediatek/filogic/6.6.133
src/gz kwrt_base https://holyhbc.github.io/Kwrt/releases/04.16/packages/aarch64_cortex-a53/base
src/gz kwrt_luci https://holyhbc.github.io/Kwrt/releases/04.16/packages/aarch64_cortex-a53/luci
src/gz kwrt_packages https://holyhbc.github.io/Kwrt/releases/04.16/packages/aarch64_cortex-a53/packages
src/gz kwrt_routing https://holyhbc.github.io/Kwrt/releases/04.16/packages/aarch64_cortex-a53/routing
src/gz kwrt_kiddin9 https://holyhbc.github.io/Kwrt/releases/04.16/packages/aarch64_cortex-a53/kiddin9
```

然后运行：
```
opkg update
```
