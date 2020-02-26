#!/bin/bash

# To use an Openstack cloud you need to authenticate against keystone, which
# returns a **Token** and **Service Catalog**. The catalog contains the
# endpoint for all services the user/tenant has access to - including nova,
# glance, keystone, swift.
#
export OS_AUTH_URL=https://auth.cloud.ovh.net/v3.0/
export OS_IDENTITY_API_VERSION=3

# With the addition of Keystone we have standardized on the term **tenant**
# as the entity that owns the resources.
export OS_TENANT_ID=1234
export OS_TENANT_NAME=5678

# In addition to the owning entity (tenant), openstack stores the entity
# performing the action as the **user**.
export OS_USERNAME=johndoe

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

# If your configuration has multiple regions, we set that information here.
if [ -z "$OS_REGION_NAME" ];
then
# OS_REGION_NAME is optional and only valid in certain environments.
    export OS_REGION_NAME="GRA5"
fi
# Don't leave a blank variable, unset it if it was empty
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi
