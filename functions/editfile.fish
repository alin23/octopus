function editfile
    set -l file (commandline -t)
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
