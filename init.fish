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

function __zoxide_check_pwd_changed --on-event fish_preexec
    if command_exists zoxide; and contains cd (string split -- ' ' "$argv[1]")
        set -g __CD_COMMAND_EXEC "$argv[1]"
        set -g __CD_COMMAND_PWD "$PWD"
    end
end

function __zoxide_add --on-event fish_postexec
    if command_exists zoxide;
        and set -q __CD_COMMAND_EXEC;
        and test "$__CD_COMMAND_EXEC" = "$argv[1]";
        and set -q __CD_COMMAND_PWD;
        and test "$__CD_COMMAND_PWD" != "$PWD"
        zoxide add
    end
end

init_env
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
    # init_gpg &
end
# init_iterm
# showmail