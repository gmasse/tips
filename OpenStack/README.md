# OpenStack tips


## How to use MacOS Keychain with your OpenRC client file

Add a new password in your Keychain `File->New Password Item (cmd+N)`:
```
Name: "OVH Public Cloud"
Account: your_openstack_username
Password: your_openstack_password
```

Copy the following line to your openrc file:
```
export OS_PASSWORD=$(security find-generic-password -a ${OS_USERNAME} -s "OVH Public Cloud" -w)
```
