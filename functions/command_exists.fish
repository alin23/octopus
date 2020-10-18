function command_exists
    argparse --name command_exists 'v/verbose' -- $argv

    set varname (string escape --style=var -- $argv[1])
    if set -q "$varname"_EXISTS
        if set -q _flag_verbose
            eval echo '$'(echo -n "$varname"_EXISTS)
        end
        return 0
    end

    set cmdout (command -s $argv[1]; or which $argv[1] 2>/dev/null | tr -d '[:space:]')
    if test -n "$cmdout"
        set -xg "$varname"_EXISTS $cmdout
        return 0
    end

    return 1
end
