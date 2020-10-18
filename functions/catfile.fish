function catfile
    set -l file (commandline -t)

    if not test -f "$file"
        if command_exists "$file"
            set file (command_exists -v "$file")
        else
            type "$file"
            commandline -f repaint
            return $status
        end
    end

    batview $file
    commandline -f repaint
end
