init_env 2>/dev/null

if not set -q NO_FISH_INIT; and not set -q LC_NO_FISH_INIT
    init_abbr 2>/dev/null
    init_pyenv 2>/dev/null
end

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
