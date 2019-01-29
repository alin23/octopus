function ssgh
    git clone --recursive git@github.com:$argv[1] $HOME/Gitlab/$argv[1]
    subl $HOME/Gitlab/$argv[1]
end
