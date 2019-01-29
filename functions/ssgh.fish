function ssgh
    git clone --recursive git@github.com:$argv[1] $HOME/Github/$argv[1]
    subl $HOME/Github/$argv[1]
end
