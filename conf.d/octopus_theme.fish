# Terminal color theme, kept in the package so it travels to every device
# octopus is installed on. This replaces fish's `fish_frozen_theme.fish`, the
# migration artifact fish 4.3 dropped in conf.d when theme variables moved from
# universal to global scope (the file fish itself tells you to delete).
#
# conf.d runs before config.fish, so a machine-local config.fish can still
# override any of these. To re-theme interactively use `fish_config theme`.

set --global fish_color_autosuggestion 54516C
set --global fish_color_cancel FFDD49
set --global fish_color_command ffaf00
set --global fish_color_comment 54516C
set --global fish_color_cwd FFFFFF
set --global fish_color_cwd_root 800000
set --global fish_color_end 0087ff
set --global fish_color_error ff0000
set --global fish_color_escape 708966
set --global fish_color_history_current normal
set --global fish_color_host 71C964
set --global fish_color_host_remote yellow
set --global fish_color_keyword AF87FF --bold
set --global fish_color_match 80B3FF
set --global fish_color_normal FFFFFF
set --global fish_color_operator 93C4B5
set --global fish_color_option af5f87 --dim
set --global fish_color_param af5f87
set --global fish_color_quote 77C8BB
set --global fish_color_redirection AA79C0
set --global fish_color_search_match FFDD49
set --global fish_color_selection c0c0c0
set --global fish_color_status red
set --global fish_color_user 4DAFAD
set --global fish_color_valid_path normal
set --global fish_pager_color_completion normal
set --global fish_pager_color_description B3A06D yellow
set --global fish_pager_color_prefix white --bold --underline
set --global fish_pager_color_progress brwhite --background=cyan
set --global fish_pager_color_selected_background -r
