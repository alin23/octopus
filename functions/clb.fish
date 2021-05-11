function clb -a repo
    set repo (remote $repo)

    git clone --recursive git@gitlab.com:$repo $HOME/Gitlab/$repo
    cd $HOME/Gitlab/$repo
end
