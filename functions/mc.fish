function mc
    set MC_USER (id | sed 's/[^(]*(//;s/).*//')
    set MC_PWD_FILE "$TMPDIR/mc-$MC_USER/mc.pwd."(echo %self)
    env SHELL=(which fish) TERM=xterm-256color VIEWER=batview command mc -P "$MC_PWD_FILE" $argv

    if test -r "$MC_PWD_FILE"
        set MC_PWD (cat "$MC_PWD_FILE")
        if test -n "$MC_PWD"; and test -d "$MC_PWD"
            cd "$MC_PWD"
        end
        set -e MC_PWD
    end

    rm -f "$MC_PWD_FILE"
    set -e MC_PWD_FILE
    set -e MC_USER
end
