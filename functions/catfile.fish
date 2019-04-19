function catfile
    set -l file (commandline -t)
    if command_exists bat
        bat $file
    else
        less $file
    end
    commandline -f repaint
end
