function ap -d "Add to path"
    set -xU fish_user_paths $argv $fish_user_paths
end
