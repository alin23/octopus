function pbpaste
    if set -q TMPF_PBCOPY
        cat $TMPF_PBCOPY
    end
end
