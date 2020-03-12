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

function init_z --on-event fish_postexec
    if contains cd (string split -- ' ' "$argv[1]"); and command_exists zoxide
        zoxide add
    end
end

if not set -q NO_FISH_INIT
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