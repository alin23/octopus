function nowlogin
    set team $argv[1]
    if test -d "$HOME/Documents/Now/$team"
        cp -f $HOME/Documents/Now/$team/* $HOME/.now/
    else
        echo "Team $team does not exist"
    end
end
