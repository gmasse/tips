## Linux
Fixing USB device name over reboot (base on physical USB port)a
```
$ cat /etc/udev/rules.d/90-ttyUSB.rules
KERNEL=="ttyUSB*", KERNELS=="1-1.2", NAME="ttyUSB0", SYMLINK+="esp32_dev", GROUP="platformio"
KERNEL=="ttyUSB*", KERNELS=="1-1.3", NAME="ttyUSB1", SYMLINK+="esp32_prod"
```

### ESP flash erasure
```
$ .platformio/packages/tool-esptoolpy/esptool.py --chip esp32 --port /dev/ttyUSB0 erase_flash
$ platformio device monitor -p /dev/ttyUSB0 -b 115200
```

### Converting Backtrace address
```
$ for addr in $(cat backtrace.txt); do \
~/.platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-addr2line -pfiaC \
-e .pio/build/fm-devkit/firmware.elf $addr ; \
done
```
