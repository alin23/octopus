completion_functions


function __suggest_domain_targets
    set uid (id -u)
    echo "gui/$uid"
    echo "user/$uid"
    echo "system"
end

function __suggest_service_targets
    set uid (id -u)
    launchctl print user/$uid | awk '/\tservices = \{/{p=1;next} /\}/{p=0;next} p {print "user/'$uid'/"$3}'
    launchctl print gui/$uid | awk '/\tservices = \{/{p=1;next} /\}/{p=0;next} p {print "gui/'$uid'/"$3}'
    launchctl print system | awk '/\tservices = \{/{p=1;next} /\}/{p=0;next} p {print "system/"$3}'
end

function __suggest_service_plist
    ls \
    ~/Library/LaunchAgents/*.plist \
    /Library/LaunchAgents/*.plist \
    /Library/LaunchDaemons/*.plist \
    /System/Library/LaunchAgents/*.plist \
    /System/Library/LaunchDaemons/*.plist
end

function __suggest_service_plist_and_targets
    __suggest_service_plist
    __suggest_service_targets
end

__complete_arg launchctl load -a "(__suggest_service_plist)"
__complete_arg launchctl unload -a "(__suggest_service_plist)"

__complete_arg launchctl "bootstrap; and [ (count (__fish_complete_args)) = 1 ]" -a "(__suggest_domain_targets)"
__complete_arg launchctl "bootstrap; and [ (count (__fish_complete_args)) = 2 ]" -a "(__suggest_service_plist_and_targets)"
__complete_arg launchctl bootout -a "(__suggest_service_plist_and_targets)"

__complete_arg launchctl kickstart -a "(__suggest_service_targets)"
__complete_arg launchctl kickstart -s k       -d "If the service is already running, kill the running instance before restarting the service."
__complete_arg launchctl kickstart -s p       -d "Upon success, print the PID of the new process or the already-running process to stdout."

__complete_arg launchctl attach -a "(__suggest_service_targets)"
__complete_arg launchctl attach -s k       -d "If the service is already running, kill the running instance."
__complete_arg launchctl attach -s s       -d "Force the service to start."
__complete_arg launchctl attach -s x       -d "Attach to xpcproxy(3) before it execs and becomes the service process. This flag is generally not useful for anyone but the launchd maintainer."

__complete_arg launchctl start -a "(__suggest_service_targets)"
__complete_arg launchctl stop -a "(__suggest_service_targets)"

__complete_arg launchctl debug -a "(__suggest_service_targets)"
__complete_arg launchctl debug -l program -a '(__fish_complete_path (string replace -a -- --stdin= "" (commandline -t)))' -d "Instructs launchd(8) to use program-path as the service's executable."
__complete_arg launchctl debug -l guard-malloc -d "Turns on libgmalloc(3) for the service."
__complete_arg launchctl debug -l malloc-stack-logging -d "Turns on malloc(3) stack logging for the service."
__complete_arg launchctl debug -l malloc-nano-allocator -d "Turns on the malloc(3) nano allocator for the service."
__complete_arg launchctl debug -l debug-libraries -d "Sets the DYLD_IMAGE_SUFFIX for the service to \"_debug\", which prefers the debug variants of libraries if they exist. See dyld(1) for more information."
__complete_arg launchctl debug -l introspection-libraries -d "Adds /usr/lib/system/introspection to the DYLD_LIBRARY_PATH environment variable for the service. This causes the system to prefer the introspection variants of libraries if they exist."
__complete_arg launchctl debug -l NSZombie -d "Enables NSZombie."
__complete_arg launchctl debug -l 32 -d "Runs the service in the appropriate 32-bit architecture. Only available on 64-bit platforms."
__complete_arg launchctl debug -l stdin -a '(__fish_complete_path (string replace -a -- --stdin= "" (commandline -t)))' -d "Sets the service's standard input to be stdin-path. If no file is given, uses the current terminal as the service's standard input. If stdin-path does not exist, it is created."
__complete_arg launchctl debug -l stdout -a '(__fish_complete_path (string replace -a -- --stdin= "" (commandline -t)))' -d "Sets the service's standard input to be stdout-path. If no file is given, uses the current terminal as the service's standard input. If stdout-path does not exist, it is created."
__complete_arg launchctl debug -l stderr -a '(__fish_complete_path (string replace -a -- --stdin= "" (commandline -t)))' -d "Sets the service's standard input to be stderr-path. If no file is given, uses the current terminal as the service's standard input. If stderr-path does not exist, it is created."
__complete_arg launchctl debug -l environment -d "VARIABLE0=value VARIABLE1=value ... Sets the given environment variables on the service."

__complete_arg launchctl print -a "(__suggest_service_targets)"
__complete_arg launchctl remove -a "(__suggest_service_targets)"
__complete_arg launchctl "kill; and [ (count (__fish_complete_args)) = 1 ]" -a "(__fish_complete_signals)"
__complete_arg launchctl "kill; and [ (count (__fish_complete_args)) = 2 ]" -a "(__suggest_service_targets)"
__complete_arg launchctl blame -a "(__suggest_service_targets)"
__complete_arg launchctl enable -a "(__suggest_service_targets)"
__complete_arg launchctl disable -a "(__suggest_service_targets)"
