function rp -d "Remove from path"
    argparse --name rp 'g/global' 'a/all' -- $argv

    if set -q _flag_all
        set -xg PATH (string replace -a $argv "" -- $PATH)
        set -xU fish_user_paths (string replace -a $argv "" -- $fish_user_paths)
    else if set -q _flag_global
        set -xg PATH (string replace -a $argv "" -- $PATH)
    else
        set -xU fish_user_paths (string replace -a $argv "" -- $fish_user_paths)
    end
end
