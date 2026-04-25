# Kwrt Package Repository

| 项目 | 信息 |
|------|------|
| 最后更新 | Sat Apr 25 03:24:04 UTC 2026 |
| 版本号 | 04.25 |
| 提交ID | bc64398474b90fa1f79d21a5c7528811d9e04236 |
| 固件设备 | mediatek_filogic |
| 内核版本 | 6.6.127 |

## 使用方法

在路由器的 `/etc/opkg/customfeeds.conf` 中添加：

```
src/gz kwrt_core https://holyhbc.github.io/Kwrt/releases/04.25/targets/mediatek/filogic/6.6.127
src/gz kwrt_base https://holyhbc.github.io/Kwrt/releases/04.25/aarch64_cortex-a53/base
src/gz kwrt_luci https://holyhbc.github.io/Kwrt/releases/04.25/aarch64_cortex-a53/luci
src/gz kwrt_packages https://holyhbc.github.io/Kwrt/releases/04.25/aarch64_cortex-a53/packages
src/gz kwrt_routing https://holyhbc.github.io/Kwrt/releases/04.25/aarch64_cortex-a53/routing
src/gz kwrt_kiddin9 https://holyhbc.github.io/Kwrt/releases/04.25/aarch64_cortex-a53/kiddin9
```

然后运行：
```
opkg update
```
