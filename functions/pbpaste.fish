function pbpaste
    if set -q TMPF_PBCOPY
        cat $TMPF_PBCOPY
    else
        command pbpaste
    end
end
