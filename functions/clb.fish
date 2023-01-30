function clb -a repo
    set repo (remote $repo)

    git clone --filter=blob:none --recursive git@gitlab.com:$repo $HOME/Gitlab/$repo
    cd $HOME/Gitlab/$repo
end
