function command_exists
    command -q $argv[1]
    # which $argv[1] >/dev/null 2>/dev/null
end
