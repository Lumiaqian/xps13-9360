## MacOS with xps-9360

### 运行情况

- [x]  声音
- [x]  显卡
- [x]  网卡
- [x]  触摸板
- [x]  睡眠
- [x]  蓝牙
- [x]  变频
- [x] 亮度
- [x] 电池管理
- [x] 雷电口热拔插

### 配置

型号 : Dell XPS 13-9360-3609

CPU : i5-8250U

显卡 : UHD620

网卡 : DW1560

内存 : 8G

硬盘 : PM961(512G)

BIOS版本 :最新版

系统版本 : 10.15.1

Clover版本：最新版

### 准备工作：

- 更换硬盘，换成了PM961
- 更换网卡,内置 killer1535 网卡无法驱动,故需更换网卡,推荐 DW1560/DW1830,DW1830有三根天线,DW1560和原装网卡两根天线接口
- 更新BIOS到最新版本
- 配置BIOS：按照下面配置BIOS

\- Sata: AHCI

\- Enable SMART Reporting

\- Disable thunderbolt boot and pre-boot support

\- USB security level: disabled

\- Enable USB powershare

\- Enable Unobtrusive mode

\- Disable SD card reader (saves 0.5W of power)

\- TPM Off

\- Deactivate Computrace

\- Enable CPU XD

\- Disable Secure Boot

\- Disable Intel SGX

\- Enable Multi Core Support

\- Enable Speedstep

\- Enable C-States

\- Enable TurboBoost

\- Enable HyperThread

\- Disable Wake on USB-C Dell Dock

\- Battery charge profile: Standard

\- Numlock Enable

\- FN-lock mode: Disable/Standard

\- Fastboot: minimal

\- BIOS POST Time: 0s

\- Enable VT

\- Disable VT-D

\- Wireless switch OFF for Wifi and BT

\- Enable Wireless Wifi and BT

\- Allow BIOS Downgrade

\- Allow BIOS Recovery from HD, disable Auto-recovery

\- Auto-OS recovery threshold: OFF

\- SupportAssist OS Recovery: OFF

- 修改DVMT:进入了CLOVER界面，选择启动Shell，启动的是位于CLOVER/tools目录下的Shell64U.efi。这个Shell是用于修改BIOS配置，另一个Shell已经重命名为Shell64U.efi.bak，如果修改完BIOS配置后有需要的话，可以将Shell64U.efi.bak改回来。按以下表格修改

  修改命令：

  ```shell
  setup_var 0x4de 0x00
  setup_var 0x785 0x06
  setup_var 0x786 0x03
  ```

| Variable              | Offset | 默认值         | 修改值          | Comment                                                    |
| --------------------- | ------ | -------------- | --------------- | ---------------------------------------------------------- |
| CFG Lock              | 0x4de  | 0x01 (Enabled) | 0x00 (Disabled) | Disable CFG Lock to prevent                                |
| DVMT Pre-allocation   | 0x785  | 0x01 (32M)     | 0x06 (192M)     | Increase DVMT pre-allocated size to 192M for QHD+ displays |
| DVMT Total Gfx Memory | 0x786  | 0x01 (128M)    | 0x03 (MAX)      | Increase total gfx memory limit to maximum                 |





### 安装

参考：https://github.com/AmourHah/XPS9360_Hackintosh 或 https://github.com/0xHJK/XPS13-9360-i5-8250U-macOS 以及  [联想小新Air 13安装黑苹果兼macOS Mojave安装教程](https://blog.daliansky.net/Lenovo-Xiaoxin-Air-13-macOS-Mojave-installation-tutorial.html)

### 开启HIDPI

使用 [one-key-hidpi](https://github.com/xzhih/one-key-hidpi)

### 一些问题

1. 声音问题，插入耳机无声音，通过ALCPlugFix解决
2. 系统升级无声音，删除`/Library/Extensions/AppleHDA_ALC256.kext`文件，然后用Kext Wizard程序重建缓存即可
3. 其他问题暂时没有发现

### 感谢

- [the-darkvoid/XPS9360-macOS](https://github.com/the-darkvoid/XPS9360-macOS)
- [syncmaster851/XPS9360-EFI](https://github.com/syncmaster851/XPS9360-EFI)
-  [0xHJK/XPS13-9360-i5-8250U-macOS]( https://github.com/0xHJK/XPS13-9360-i5-8250U-macOS)
- 以及其他工具、kext、文章贡献者、远景论坛的各位老哥
