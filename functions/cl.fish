function cl -a repo
    set repo (remote $repo)

    git clone --recursive git@github.com:$repo $HOME/Github/$repo
    cd $HOME/Github/$repo
end
