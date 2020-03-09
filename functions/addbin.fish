function pipeto
    echo ''
    eval (commandline)' | '$argv[1]
    commandline -f repaint
end
