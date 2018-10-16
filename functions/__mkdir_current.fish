function __mkdir_current
    echo ''
    mkdir -vp (commandline -t)
    commandline -f repaint
end