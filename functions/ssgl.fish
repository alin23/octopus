function ssgl -a repo
    set repo (remote $repo)

    git clone git@gitlab.com:$repo $HOME/Gitlab/$repo; or true
    $EDITOR $HOME/Gitlab/$repo
end
