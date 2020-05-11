function ranger
    set -x TERM xterm-kitty
    set -x PYTHONWARNINGS ignore
    set -x SHELL (which fish)
    set -x NO_FISH_INIT 1
    if is_darwin
        set -x VISUAL subl
    else
        set -x VISUAL rsub
    end

    set tempfile (mktemp -t tmp.XXXXXX)
    command ranger --choosedir=$tempfile $argv
    if test -s $tempfile
        set ranger_pwd (cat $tempfile)
        if test -n $ranger_pwd -a -d $ranger_pwd
            builtin cd -- $ranger_pwd
        end
    end

    command rm -f -- $tempfile
end