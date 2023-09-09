function editfile
    set -l file (eval echo (commandline -t))

    if not test -f "$file"
        if command_exists "$file"
            set file (command_exists -v "$file")
        else if test (type -t "$file") = "function"
            funced -s "$file"
            commandline -f repaint
            return $status
        end
    end

    $EDITOR $file
    commandline -f repaint
end
