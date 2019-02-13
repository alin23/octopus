function ssgh
    git clone --recursive git@github.com:$argv[1] $HOME/Gitlab/$argv[1]; or true
    subl $HOME/Gitlab/$argv[1]
end
