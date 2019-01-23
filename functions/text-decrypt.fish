function text-decrypt
    set -l COPY_COMMAND echo
    set -l TEXT $argv[1]
    if command_exists pbcopy
        set COPY_COMMAND pbcopy
    end

    if test (count $argv) -eq 0
        set TEXT (pbpaste)
    end

    echo $TEXT | base64 -D | gpg --decrypt 2>/dev/null | $COPY_COMMAND

    if command_exists pbcopy
        pbpaste
    end
end
