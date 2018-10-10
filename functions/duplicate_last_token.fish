function duplicate_last_token
    set -l cur (commandline --cursor)
    set -l until_cursor (commandline -c)
    set -l trimmed (string trim -r $until_cursor)
    set -l spaces_count (string length (string match -r '\s*$' $until_cursor))
    if test $spaces_count -gt 0
        commandline -r (string replace $until_cursor $trimmed (commandline))
        set cur (math $cur - $spaces_count)
    end

    commandline --cursor $cur
    commandline -it ' '(commandline -t)
end