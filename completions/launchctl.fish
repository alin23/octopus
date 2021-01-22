completion_functions

__complete_arg launchctl load -a "(__suggest_service_plist)"
__complete_arg launchctl unload -a "(__suggest_service_plist)"

__complete_arg launchctl bootstrap -a "(__suggest_service_plist_and_targets)"
__complete_arg launchctl bootout -a "(__suggest_service_plist_and_targets)"
__complete_arg launchctl kickstart -a "(__suggest_service_plist_and_targets)"
__complete_arg launchctl start -a "(__suggest_service_plist_and_targets)"
__complete_arg launchctl stop -a "(__suggest_service_plist_and_targets)"
__complete_arg launchctl debug -a "(__suggest_service_plist_and_targets)"
__complete_arg launchctl print -a "(__suggest_service_plist_and_targets)"
