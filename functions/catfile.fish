function catfile
    set -l file (commandline -t)
    if command_exists bat
        eval bat $file
    else
        eval less $file
    end
    commandline -f repaint
end
