function debounce
    argparse --name debounce 's/seconds=' 'i/id=' -- $argv

    set seconds 3
    if set -q _flag_seconds
        set seconds $_flag_seconds
    end

    set id (string escape --style=var -- "$argv" | sha1sum | awk '{print $1}')
    if set -q _flag_id
        set id $_flag_id
    end

    set executingPath /tmp/executing-$id
    set onFinishPath /tmp/on-finish-$id

    if not test -f "$executingPath"
        touch "$executingPath"
        $argv

        fish -c "begin
            sleep $seconds
            if test -f "$onFinishPath"
                $argv
                rm -f "$onFinishPath"
            end
            rm -f "$executingPath"
        end" &

        return $status
    else if not test -f "$onFinishPath"
        touch "$onFinishPath"
    end
end
