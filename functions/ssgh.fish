function ssgh
    git clone git@github.com:$argv[1] $HOME/Github/$argv[1]; or true
    subl $HOME/Github/$argv[1]
end
