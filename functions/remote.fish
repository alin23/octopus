function remote -a repo
    if empty "$repo"
        set repo (git remote get-url origin)
    end

    if string match -qr '^http' -- $repo
        set repo (basename (dirname $repo))/(basename $repo)
    else if string match -qr '^git@' -- $repo
        set repo (basename (dirname $repo | cut -d: -f2))/(basename $repo)
    end
    
    echo $repo
end