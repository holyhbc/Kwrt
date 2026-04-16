# Kwrt Package Repository

| 项目 | 信息 |
|------|------|
| 最后更新 | Thu Apr 16 08:37:47 UTC 2026 |
| 版本号 | 04.16 |
| 提交ID | 4cc1e32ba89bde5b502d72af76d8b9aa1330f804 |
| 固件设备 | mediatek_filogic |

## 使用方法

在路由器的  中添加：

```
src/gz kwrt_core https://holyhbc.github.io/Kwrt/releases/04.16/targets/mediatek/filogic/6.6.129
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
