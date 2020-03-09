bind \es 'set c (commandline -C); and commandline -C 0; and commandline -i "sudo "; and commandline -C (math $c+5)'
bind \ew 'printf "\n%s\n" (which (commandline -t)); and commandline -f repaint'
bind \e- 'prevd ^/dev/null >/dev/null; and commandline -f repaint'
bind \e= 'nextd ^/dev/null >/dev/null; and commandline -f repaint'

bind \e\[1\;5D backward-bigword
bind \e\[1\;5C forward-bigword
bind \cw backward-kill-bigword
bind \eW kill-bigword
bind \e/ backward-kill-path-component
bind \em 'duplicate_last_token'

bind \e\[1\;5A history-token-search-backward
bind \e\e\[A history-token-search-backward
bind \e\[1\;5B history-token-search-forward
bind \e\e\[B history-token-search-forward
bind \e, history-token-search-forward
bind \et 'lsd -l --tree; and commandline -f repaint'
bind \eT '__tldr'
bind \eH '__help_cmd'
bind \eM '__mkdir_current'
bind '~' 'commandline -it $HOME/'
bind ` 'commandline -it "~/"'
bind \e` 'commandline -it "`"'
bind \eW 'commandline -rt ( which (commandline -t) )'
bind \cf\ca 'abbr|fzf'
bind \cf\cb 'print_bindings|fzf'
bind \cf\ce 'env|fzf'
bind § 'commandline -it "~"'
bind \\ 'commandline -it " | "'
bind \e\| 'commandline -it "\\\"'
bind \eb 'catfile'
bind \ce 'editfile'
bind \cs 'echo ''; echo Executing sudo (history -1); eval sudo (history -1); commandline -f repaint'
bind \ct 'transpose-words'
if command_exists zoxide
    bind \ez 'z -i'
end

bind \cx\cf "pipeto fzf"
bind \cx\cb "pipeto 'bat --color always'"
bind \cx\cs "echo ''; eval sudo (commandline); commandline -f repaint"
bind \cx\ce "pipeto 'subl -'"
bind \cx\ch "pipeto head"
bind \cx\ct "pipeto 'tail -f'"
bind \cx\cl "pipeto 'wc -l'"
bind \cx\cc "pipeto pbcopy"
bind \cx\cw "eval watch -d --color (commandline); commandline -f repaint"

bind \cx\cx "commandline -it ' | xargs -0 -I \{\} echo \'{}\''; and commandline -C (math (commandline -C) - 5)"
bind \cx\cg "commandline -it ' | rg -i '"

bind \cp\cq "history -1 | pbcopy"
bind \cp\cw "history -2 | tail -n 1 | pbcopy"
bind \cp\ce "history -3 | tail -n 1 | pbcopy"
bind \cp\cr "history -4 | tail -n 1 | pbcopy"
bind \cp\ct "history -5 | tail -n 1 | pbcopy"
bind \cp\cy "history -6 | tail -n 1 | pbcopy"
bind \cp\cu "history -7 | tail -n 1 | pbcopy"
bind \cp\ci "history -8 | tail -n 1 | pbcopy"
bind \cp\co "history -9 | tail -n 1 | pbcopy"
bind \cp\cp "history -10 | tail -n 1 | pbcopy"