function __help_cmd
    for cmd in (commandline -o)
        if test $cmd != 'sudo' -a $cmd != 'env'
            set realcmd $cmd
            break
        else
            set realcmd $cmd
        end
    end

    if set -q realcmd
        echo ''
        if $realcmd --help >/dev/null ^/dev/null
            $realcmd --help
        else if $realcmd -help >/dev/null ^/dev/null
            $realcmd -help
        else if $realcmd -h >/dev/null ^/dev/null
            $realcmd -h
        else
            $realcmd --help
        end
    end

    set -e realcmd
    commandline -f repaint
end