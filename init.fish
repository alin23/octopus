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


function init_z --on-event fish_prompt
    if command_exists zoxide
        zoxide add
    end
end
function testz --on-event fish_postexec
    echo testz $argv[1]
end
function testz2 --on-variable PWD
    echo testz2 $PWD
end

function testz3
    cd /tmp
    cd /etc
    cd -
    cd -
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