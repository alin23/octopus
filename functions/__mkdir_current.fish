function __mkdir_current
    echo \n'Creating dir '(commandline -t)
    eval 'mkdir -vp '(commandline -t)
    commandline -f repaint
end