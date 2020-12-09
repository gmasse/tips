function 1ssh {
    # retry to connect until instance is ready
    
    local args=$*

    if (( $# == 0 ));
    then
        echo 'usage: 1ssh DESTINATION [ARGUMENTS] ...'
    fi

    while true;
    do
        ssh -q -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -o "ConnectTimeout=3" $* -- 'test -f /var/lib/cloud/instance/boot-finished'
        exitcode=$?
        if [[ $exitcode -eq 0 ]];
        then
            # Connect
            ssh -q -t -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" $* --
            break
        elif [[ $exitcode -eq 255 ]];
        then
            # SSH exit (probably time-out, but it can be a right issue, etc)
            echo -n "."
        else
            # SSH connection succeeded but command failure (normally it means the boot-finished file does not exist)
            echo -n "_"
        fi
        sleep 1
    done
}
