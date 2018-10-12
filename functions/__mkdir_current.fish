function __mkdir_current
    mkdir -vp (commandline -t)
    commandline -f repaint
end