function add-git-remote
    git remote add $argv[1] git@github.com:$argv[1]/(basename $PWD)
    git fetch $argv[1]
end