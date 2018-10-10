function __tldr
    # Get all commandline tokens not starting with "-"
    set -l args (commandline -po | string match -rv '^-')

    # If commandline is empty, exit.
    if not set -q args[1]
        printf \a
        return
    end

    # If there are at least two tokens not starting with "-", the second one might be a subcommand.
    # Try "tldr first-second" and fall back to "tldr first" if that doesn't work out.
    set -l maincmd (basename $args[1])
    set -l output ''
    set -l IFS ''
    if set -q args[2]
        set output (tldr "$maincmd-$args[2]" ^/dev/null)
        or set output (tldr "$maincmd" ^/dev/null)
        and echo $output
        or printf \a
    else
        set output (tldr "$maincmd" ^/dev/null)
        and echo $output
        or printf \a
    end

    commandline -f repaint
end