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
# MacOS environment?
if [ "$(uname)" = "Darwin" ];
then
    # Test if `security` binary exists
    if [ -x "$(command -v 'security')" ];
    then
        # Look for the password in the keychain
        if security find-generic-password -a ${OS_USERNAME} -s "OVH Public Cloud" >/dev/null 2>&1;
        then
            export OS_PASSWORD=$(security find-generic-password -a ${OS_USERNAME} -s "OVH Public Cloud" -w)
        else
            while true; do
                echo -n "Do you wish to store the password in MacOS keychain? (y/N) "
                read yn
                case $yn in
                    [Yy]* ) security add-generic-password -a ${OS_USERNAME} -s "OVH Public Cloud" -w ; export OS_PASSWORD=$(security find-generic-password -a ${OS_USERNAME} -s "OVH Public Cloud" -w) ; break;;
                    * ) break;;
                esac
            done
        fi
    fi
fi
# Fallback to command line password prompt
if [ -z $OS_PASSWORD ];
then
    echo "Please enter OpenStack Password for User=$OS_USERNAME: "
    read -sr OS_PASSWORD_INPUT
    export OS_PASSWORD=$OS_PASSWORD_INPUT
fi
```

More information: https://www.netmeister.org/blog/keychain-passwords.html



## Quickstart ##
OpenStack CLI installation (Virtual Environment's style):
```
python3 -m venv venv
source venv/bin/activate
pip install python-openstackclient
```
... or Python user install directory's style:
```
pip install --user python-openstackclient gnureadline
```

Resource provisioning:
```
source openrc.sh
openstack keypair create --public-key ~/.ssh/id_rsa_new.pub mykey
curl -O https://raw.githubusercontent.com/gmasse/tips/master/OpenStack/cloudinit.dev-docker
openstack server create --flavor "s1-2" --image "Ubuntu 18.04" --key-name "mykey" --user-data cloudinit.dev-docker myinstancename
```
