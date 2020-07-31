function rp -d "Remove from path"
    set -xU fish_user_paths (string replace -a $argv "" -- $fish_user_paths)
end
