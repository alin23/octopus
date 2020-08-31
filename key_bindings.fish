bind \es 'set c (commandline -C); and commandline -C 0; and commandline -i "sudo "; and commandline -C (math $c+5)'
bind \ew 'printf "\n%s\n" (which (commandline -t)); and commandline -f repaint'
bind \e- 'prevd ^/dev/null >/dev/null; and commandline -f repaint'
bind \e= 'nextd ^/dev/null >/dev/null; and commandline -f repaint'

bind \e\[1\;5D backward-bigword
bind \e\[1\;5C forward-bigword
bind \eF forward-bigword
bind \eB backward-bigword
bind \cw backward-kill-bigword
bind \eW kill-bigword
bind \e/ backward-kill-path-component
bind \em 'duplicate_last_token'

bind \e\[1\;5A history-token-search-backward
bind \e\e\[A history-token-search-backward
bind \e\[1\;5B history-token-search-forward
bind \e\e\[B history-token-search-forward
bind \e, history-token-search-forward

bind '~' 'commandline -it \'$HOME/\''
bind \cb 'catfile'
bind \ce 'editfile'
bind \cf\ca 'abbr|fzf'
bind \cf\cb 'print_bindings|fzf'
bind \cf\cd 'commandline -it (zoxide query -i)'
bind \cf\ce 'env|fzf'
bind \cf\ch '__help_cmd|fzf'
bind \cs 'echo ''; echo Executing sudo (history -1); eval sudo (history -1); commandline -f repaint'
bind \ct 'transpose-words'
bind \e\| 'commandline -it " || "'
bind \e` 'commandline -it "`"'
bind \eH '__help_cmd'
bind \el 'list_current_token -l'
bind \eM '__mkdir_current'
bind \eT '__tldr'
bind \et 'list_current_token -l --tree'
bind \eW 'commandline -rt ( which (commandline -t) )'
bind \ex 'echo ''; echo sudo chmod +x (commandline -t); eval sudo chmod +x (commandline -t); echo ''; commandline -f repaint'
bind ` 'commandline -it "~/"'
bind § 'commandline -it "~"'
bind \eg "commandline -it ' | rg -i '"

if command_exists zoxide
    bind \ez 'z -i'
end

bind \cx\cb "pipeto 'bat --color always'"
bind \cx\cc "pipeto pbcopy; echo \nCopied to clipboard: ; pbpaste; commandline -f repaint"
bind \cx\ce "pipeto 'subl -'"
bind \cx\cf "pipeto fzf"
bind \cx\ch "pipeto head"
bind \cx\cl "pipeto 'wc -l'"
bind \cx\cr "tmux capture-pane -p -S '-' -E '-' | rsub"
bind \cx\cs "echo ''; eval sudo (commandline); commandline -f repaint"
bind \cx\ct "pipeto 'tail -f'"
bind \cx\cw "eval watch -d --color (commandline); commandline -f repaint"

bind \cx\cx "commandline -it ' | xargs -0 -I \{\} echo \'{}\''; and commandline -C (math (commandline -C) - 5)"

bind \cp\cq "history -1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\cw "history -2 | tail -n 1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\ce "history -3 | tail -n 1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\cr "history -4 | tail -n 1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\ct "history -5 | tail -n 1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\cy "history -6 | tail -n 1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\cu "history -7 | tail -n 1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\ci "history -8 | tail -n 1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\co "history -9 | tail -n 1 | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"
bind \cp\cp "commandline -b | pbcopy; echo \nCopied: ; pbpaste; commandline -f repaint"