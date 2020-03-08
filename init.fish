if not set -q NO_FISH_INIT
    if command_exists zoxide
        function init_z --on-event fish_prompt
            zoxide add
        end
    end
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