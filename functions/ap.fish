function ap -d "Add to path"
    argparse --name ap 'g/global' 'a/all' -- $argv

    if set -q _flag_all
        set -xg PATH $argv $PATH
        set -xU fish_user_paths $argv $fish_user_paths
    else if set -q _flag_global
        set -xg PATH $argv $PATH
    else
        set -xU fish_user_paths $argv $fish_user_paths
    end
end
