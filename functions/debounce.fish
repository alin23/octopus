function debounce
    argparse --name debounce 's/seconds=' -- $argv

    set seconds 3
    if set -q _flag_seconds
        set seconds $_flag_seconds
    end

    set executingPath /tmp/executing-(string escape --style=var -- "$argv")
    set onFinishPath /tmp/on-finish-(string escape --style=var -- "$argv")

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
