function batview
    export LESS='-r -R --ignore-case --status-column --LONG-PROMPT --HILITE-UNREAD --tabs=4 --no-init --window=-4'
    bat --paging=always --pager=less $argv
end
