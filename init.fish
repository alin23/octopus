if not set -q NO_FISH_INIT
    init_z
    init_abbr
end
init_env
if not set -q NO_FISH_INIT
    init_pyenv
    init_rbenv
    init_gpg &
end
# init_iterm
# showmail