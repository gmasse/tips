# Raspberry Pi

## Python wheels
Some package can take hours to compile on Raspberry Pi. A solution is to use pre-compiled packages from [piwheels.org](https://www.piwheels.org).

Create or edit `/etc/pip.conf`:
```
[global]
extra-index-url=https://www.piwheels.org/simple
```
