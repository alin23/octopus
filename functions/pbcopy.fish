function tempfile
    if command_exists tempfile
        command tempfile
    else
        command mktemp
    end
end

function pbcopy
    set unamestr (uname)
    if test "$unamestr" = 'Linux'
        set -xg TMPF_PBCOPY (tempfile)
        cat | tee $TMPF_PBCOPY | nc -q0 localhost 2224
    else if string match -qr 'FreeBSD|Darwin' -- "$unamestr"
        if test -n "$SSH_CLIENT"
            set -xg TMPF_PBCOPY (tempfile)
            cat | tee $TMPF_PBCOPY | nc -c localhost 2224
        else
            cat | command pbcopy
        end
    end
end
