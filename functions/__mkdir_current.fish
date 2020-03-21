function __mkdir_current
    echo 'Creating dir commandline -t'
    mkdir -vp (commandline -t)
    commandline -f repaint
end