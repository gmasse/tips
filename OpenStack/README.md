# OpenStack tips


## How to use MacOS Keychain with your OpenRC client file

Add a new password in your Keychain `File->New Password Item (cmd+N)`:
```
Name: "OVH Public Cloud"
Account: your_openstack_username
Password: your_openstack_password
```

Copy the following line to your openrc file:
```Shell
# With Keystone you pass the keystone password.
export OS_PASSWORD=
# Test if `security` binary exists (MacOS environment)
if [ -x "$(command -v 'security')" ];
then
    # Look for the password in the keychain
    if security find-generic-password -a ${OS_USERNAME} -s "OVH Public Cloud" >/dev/null 2>&1;
    then
        export OS_PASSWORD=$(security find-generic-password -a ${OS_USERNAME} -s "OVH Public Cloud" -w)
    fi
fi
# if no password found in keychain, ask directly from command line
if [ -z $OS_PASSWORD ]
then
    echo "Please enter OpenStack Password for User=$OS_PASSWORD: "
    read -sr OS_PASSWORD_INPUT
    export OS_PASSWORD=$OS_PASSWORD_INPUT
fi
```

More information: https://www.netmeister.org/blog/keychain-passwords.html
