function remote -a repo
    if empty "$repo"
        set repo (git remote get-url origin)
    end

    if string match -qr '^http' -- $repo
        set repo (path basename (path dirname $repo))/(path basename $repo)
    else if string match -qr '^git@' -- $repo
        set repo (path basename (path dirname $repo | cut -d: -f2))/(path basename $repo)
    end
    
    echo $repo
end