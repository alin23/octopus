function rpbcopy
    set unamestr (uname)
    if test "$unamestr" = 'Linux'
        echo -e "Linux SSH: Copying to Clipboard."
        cat | nc -q0 localhost 2224
    else if test "$unamestr" = 'FreeBSD'
        if test -n "$SSH_CLIENT"
          echo -e "OS X SSH: Copying to Clipboard."
          cat | nc -c localhost 2224
        else
          echo -e "OS X Local: Copying to Clipboard."
          cat | pbcopy
        end
    end
end
