bind \e\e 'bind_global_alias'
bind \es 'set c (commandline -C); and commandline -C 0; and commandline -i "sudo "; and commandline -C (math $c+5)'
bind \ew 'set c (commandline -C); and commandline -C 0; and commandline -i "which "; and commandline -C (math $c+6)'
bind \e- 'cd - ^/dev/null >/dev/null; and commandline -f repaint'

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
bind \ce edit_command_buffer
bind \eH '__tldr'
bind \eM '__mkdir_current'