function cl
    git clone --recursive git@github.com:$argv[1] $HOME/Github/$argv[1]
    cd $HOME/Github/$argv[1]
end
