bind \es 'set c (commandline -C); and commandline -C 0; and commandline -i "sudo "; and commandline -C (math $c+5)'
bind \ew 'printf "\n%s\n" (which (commandline -t)); and commandline -f repaint'
bind \e- 'prevd; and commandline -f repaint'
bind \e= 'nextd; and commandline -f repaint'

bind \e\[1\;3D backward-word
bind \e\[1\;3C forward-word
bind \e\[1\;5D backward-bigword
bind \e\[1\;5C forward-bigword
# bind \eF forward-bigword
# bind \eB backward-bigword
bind \cw backward-kill-bigword
bind \eW kill-bigword
bind \e/ backward-kill-path-component
bind \em duplicate_last_token
bind \e\[3\;3~ kill-word

bind \e\[1\;5A history-token-search-backward
bind \e\e\[A history-token-search-backward
bind \e\[1\;5B history-token-search-forward
bind \e\e\[B history-token-search-forward
bind \e, history-token-search-forward

bind '~' 'commandline -it \'$HOME/\''
bind \cb catfile
bind \cv catfile
bind \ce editfile
bind \cf\ca 'abbr|fzf'
bind \cf\cb 'print_bindings|fzf'
bind \cf\cd 'commandline -it (zoxide query -i)'
bind \cf\ce 'env|fzf --preview="echo {1..} | fish_indent --ansi" --preview-window="bottom:10:wrap"'
bind \cf\ch '__help_cmd|fzf'
bind \e\[Z 'commandline -it (sqlite3 $HOME/.local/fsindex.db "SELECT path FROM fsindex" | fzf --no-info) 2>/dev/null; commandline -f repaint'
bind \e\\ 'sqlite3 $HOME/.local/fsindex.db "SELECT path FROM fsindex" | fzf --no-info; commandline -f repaint'
bind \cs 'echo ''; echo Executing sudo (history -1); eval sudo (history -1); commandline -f repaint'
bind \ct transpose-words
bind \e\| 'commandline -it " || "'
bind \e` 'commandline -it "`"'
bind \eH __help_cmd
bind \el 'list_current_token -l'
bind \eA 'list_current_token -la'
bind \eL 'echo ""; realpath (current_file_or_bin); commandline -f repaint'
bind \ep 'commandline -rt (brew --prefix (commandline -t))'
bind \eM __mkdir_current
bind \eT __tldr
bind \et 'list_current_token -l --tree'
bind \eW 'commandline -rt ( which (commandline -t) )'
bind \ex 'echo ''; echo sudo chmod +x (commandline -t); eval sudo chmod +x (commandline -t); echo ''; commandline -f repaint'
bind ` 'commandline -it "~/"'
bind § 'commandline -it "~"'
bind \eg "commandline -it ' | rg -i '"
bind \eq "git status; commandline -f repaint"
bind \ed "git diff; commandline -f repaint"

if command_exists zoxide
    bind \ez "zi; commandline -f repaint"
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

bind \cp\cq "history -1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\cw "history -2 | tail -n 1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\ce "history -3 | tail -n 1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\cr "history -4 | tail -n 1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\ct "history -5 | tail -n 1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\cy "history -6 | tail -n 1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\cu "history -7 | tail -n 1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\ci "history -8 | tail -n 1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\co "history -9 | tail -n 1 | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\cp "commandline -b | string trim | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"
bind \cp\cl "commandline -t | string trim | pbcopy; echo -n \n'Copied: '; pbpaste; echo ''; commandline -f repaint"


bind \e_ undo
bind \e+ redo
bind \e\[3\;5~ 'echo ''; history delete --contains "$(commandline -b)"; commandline -f repaint'
