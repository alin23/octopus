function text-encrypt
    set -l COPY_COMMAND echo
    if command_exists pbcopy
        set COPY_COMMAND pbcopy
    end

    echo $argv[1] | gpg -r $argv[2] --encrypt | base64 | $COPY_COMMAND

    if command_exists pbcopy
        pbpaste
    end
end
