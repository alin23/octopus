bind \e\e 'bind_global_alias'
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
bind \et 'exa -l -T; and commandline -f repaint'
bind \eT '__tldr'
bind \eH '__help_cmd'
bind \eM '__mkdir_current'
bind '~' 'commandline -it $HOME/'
bind \e` 'commandline -it "~"'
bind \eW 'commandline -rt ( which (commandline -t) )'
bind \eA 'abbr|fzf'
bind \eB 'print_bindings|fzf'
bind \eE 'env|fzf'
bind § 'commandline -it "~"'