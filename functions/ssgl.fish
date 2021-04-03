function ssgl
    git clone git@gitlab.com:$argv[1] $HOME/Gitlab/$argv[1]; or true
    subl $HOME/Gitlab/$argv[1]
end
