# OrangeFox Recovery — Xiaomi myron (POCO F8 Ultra / Redmi K90 Pro Max)


| 项目 | 规格 |
|------|------|
| 处理器 | Snapdragon 8 Elite Gen 5（SM8850 / sun） |
| CPU | Oryon（8 核） |
| 内存 | 12/16 GB |
| 存储 | 256/512 GB UFS 4.0 |
| 屏幕 | 1200×2608，120Hz OLED |
| 内核 | GKI 6.12（Android 16） |
| 分区架构 | Virtual A/B + 独立 recovery 分区 |
| 加密方式 | FBE（aes-256-xts + wrappedkey_v0） |
| KeyMint | TEE（vendor.keymint-qti）+ Strongbox（Thales JavaCard via se_omapi） |
| 振动马达 | PMIC HV haptics (qcom-hv-haptics revision 5) |

---

## 构建
### 初始化构建环境
该分支使用[haohao3001/android_bootable_recovery_A16_OFRPR12](https://github.com/haohao3001/android_bootable_recovery_A16_OFRPR12)作为源码  
目前只有bootable/recovery的源码，vendor/recovery还未上传Github  
在原版OrangeFox上删除了大量遗留代码，同时也进行了部分优化，但是不保证稳定性(可能在某些地方会有原版没有的bug)(因此这里只提供设备树，没有已编译好的recovery)  
~~纯自用说是~~  
### Build it
```bash
source build/envsetup.sh
git -C $ANDROID_BUILD_TOP/bootable/recovery apply $ANDROID_BUILD_TOP/device/xiaomi/myron/patches/0000-Add-haptics.patch #需要震动的就应用该patch
lunch twrp_myron-bp2a-eng
mka recoveryimage
```


## 支持的特性
- [X] 显示
- [X] 触屏 
- [X] 震动
- [X] 解密Data
- [X] 刷入卡刷包
- [X] 备份
- [X] KernelSU, KernelSU Next & SukiSU Ultra 安装
- [X] MTP
- [X] ADB/FastbootD
- [X] 手电筒

## 不支持的特性
- [ ] WLAN(为什么Recovery需要WLAN支持?)(遥遥无期)

## 注意
对于假回锁用户，自行构建的OrangeFox不能直接刷入recovery分区(Release里的是处理好的)，需要使用仓库下的“transplanting_vbmeta.py”脚本把原厂recovery的avb信息移植过去后再刷入  
```bash
python transplanting_vbmeta.py <原厂recovery.img> <被修补的镜像> <修补后的文件>
```
---
该分支使用/persist存储配置文件

## Maintainer
haohao3001 - 维护者  
基于[hackpupg001-a11y的设备树](https://github.com/hackpupg001-a11y/android_device_xiaomi_myron)二次开发  
recovery/root下的大部分二进制文件参考自 變換風雲@coolapk 的TWRP
