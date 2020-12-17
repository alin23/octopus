if command_exists gdate
    set -xg _date_command 'gdate'
else
    set -xg _date_command 'date'
end

if command_exists gbase64
    set -xg _base64_command 'gbase64'
else
    set -xg _base64_command 'base64'
end

if functions -q init_env
    init_env
end

if not set -q NO_FISH_INIT; and not set -q LC_NO_FISH_INIT
    if functions -q init_abbr
        init_abbr
    end
    if functions -q init_pyenv
        init_pyenv
    end
    if functions -q init_rbenv
        init_rbenv
    end
    if command_exists zoxide
        zoxide init fish | source
    end
end
