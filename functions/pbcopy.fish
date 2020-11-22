function pbcopy
    set unamestr (uname)
    set -xg TMPF_PBCOPY (tempfile)
    if test "$unamestr" = 'Linux'
        echo -e "Linux SSH: Copying to Clipboard."
        cat | tee $TMPF_PBCOPY | nc -q0 localhost 2224
    else if string match -qr 'FreeBSD|Darwin' -- "$unamestr"
        if test -n "$SSH_CLIENT"
          echo -e "OS X SSH: Copying to Clipboard."
          cat | nc -c localhost 2224
        else
          echo -e "OS X Local: Copying to Clipboard."
          cat | command pbcopy
        end
    end
end
