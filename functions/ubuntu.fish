function ubuntu
    if string match 'stop' $argv[1]
        if set -q UBUNTU_SSHD_CONTAINER
            docker stop $UBUNTU_SSHD_CONTAINER
            docker rm $UBUNTU_SSHD_CONTAINER
            set -e UBUNTU_SSHD_CONTAINER
        end
    end

    if string match 'restart' $argv[1]
        if set -q UBUNTU_SSHD_CONTAINER
            docker stop $UBUNTU_SSHD_CONTAINER
            docker rm $UBUNTU_SSHD_CONTAINER
        end
        set -U UBUNTU_SSHD_CONTAINER (docker run -d -P --name test_ubuntu_sshd ubuntu_sshd)
    end

    if not set -q UBUNTU_SSHD_CONTAINER
        set -U UBUNTU_SSHD_CONTAINER (docker run -d -P --name test_ubuntu_sshd ubuntu_sshd)
    end

    set -l port (string split ':' (docker port test_ubuntu_sshd 22))[2]
    ssh root@localhost -o StrictHostKeyChecking=no -p $port
end
