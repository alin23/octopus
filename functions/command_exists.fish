function command_exists
    command -sq $argv[1]
    # which $argv[1] >/dev/null 2>/dev/null
end
