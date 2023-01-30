function cl -a repo
    set repo (remote $repo)

    git clone --filter=blob:none --recursive git@github.com:$repo $HOME/Github/$repo
    cd $HOME/Github/$repo
end
