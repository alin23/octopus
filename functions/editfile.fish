function editfile
    set -l file (commandline -t)

    if not test -f "$file"
        if command_exists "$file"
            set file (command_exists -v "$file")
        else if test (type -t "$file") = "function"
            funced -s "$file"
            commandline -f repaint
            return $status
        end
    end

    if command_exists subl
        subl $file
    else if command_exists rsub
        rsub $file
    else if command_exists kak
        kak $file
    else
        $EDITOR $file
    end
    commandline -f repaint
end
