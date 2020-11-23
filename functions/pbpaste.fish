function pbpaste
    if set -q TMPF_PBCOPY
        cat $TMPF_PBCOPY
    else if command_exists pbpaste
        command pbpaste
    end
end
