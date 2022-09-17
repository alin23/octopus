set -xg LSD_EXISTS (which lsd 2>/dev/null)
set -xg LS_COMMAND ls
if test -n "$LSD_EXISTS"
    set -xg LS_COMMAND lsd --group-dirs first
end

function list_current_token --description 'List contents of token under the cursor if it is a directory, otherwise list the contents of the current directory'
    set val (eval echo (commandline -t))
    printf "\n"
    if test -d $val
        $LS_COMMAND $argv $val
    else
        set dir (dirname -- $val)
        if test $dir != . -a -d $dir
            $LS_COMMAND $argv $dir
        else
            $LS_COMMAND $argv
        end
    end

    set -l line_count (count (fish_prompt))
    if test $line_count -gt 1
        for x in (seq 2 $line_count)
            printf "\n"
        end
    end

    commandline -f repaint
end
