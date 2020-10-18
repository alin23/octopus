function batview
    set -xg LESS '-r -R --ignore-case --status-column --LONG-PROMPT --HILITE-UNREAD --tabs=4 --no-init --window=-4'
    if string match -q -- "*binary" (file --mime $argv[1])
        if command_exists hexyl
            hexyl --color always $argv[1] | less
        else
            xxd $argv[1] | less
        end
    else
        if command_exists bat
            bat --paging=always --pager=less $argv[1]
        else
            less $argv[1]
        end
    end
end
