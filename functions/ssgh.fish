function ssgh -a repo
    set repo (remote $repo)

    git clone --filter=blob:none git@github.com:$repo $HOME/Github/$repo; or true
    $EDITOR $HOME/Github/$repo
end
