##########################
## COMMAND LINE PARSING ##
##########################

function __fish_complete_args -d "Returns a list of all arguments given to complete"

    set -l tokens (commandline --tokenize --current-process --cut-at-cursor)
    set -e tokens[1] # remove 'complete'
    for t in $tokens
        echo $t
    end
end

function __fish_complete_opts -d "Only arguments starting with a dash (options)"
    string match --all -- '-*' (__fish_complete_args)
end

# This can be used either to get the first argument or to match it against a given list of commmands
#
# Usage examples (for `completion -n '...'`):
# * `__fish_complete_command` returns the command (first arg of complete) or exits with 1
# * `not __fish_complete_command` returns true when complete doesn't have a command yet
# * `__fish_complete_command list ls` returns true when complete command is _either_ `list` _or_ `ls`
#
function __fish_complete_command -d "Helps matching the first argument of complete"
    set args (__fish_complete_args)
    set -q args[1]; or return 1

    if count $argv
        contains -- $args[1] $argv
    else
        echo $args[1]
    end
end

function __fish_complete_subcommand -a cmd -d "Helps matching the second argument of complete"
    set args (__fish_complete_args)

    __fish_complete_command $cmd
    and set -q args[2]
    and set -l sub $args[2]
    or return 1

    set -e argv[1]
    if count $argv
        contains -- $sub $argv
    else
        echo $sub
    end
end


##########################
## COMPLETION SHORTCUTS ##
##########################

function __complete_cmd -a tocomplete cmd -d "A shortcut for defining commands completions"
    set -e argv[1..2]
    complete -f -c $tocomplete -n 'not __fish_complete_command' -a $cmd -d $argv
end

function __complete_arg -a tocomplete cond -d "A shortcut for defining arguments completion for commands"
    set -e argv[1..2]
    # NOTE: $cond can be just a name of a command (or several) or additionally any other condition
    complete -f -c $tocomplete -n "__fish_complete_command $cond" $argv
end

function __complete_sub_cmd -a tocomplete cmd sub -d "A shortcut for defining subcommands completions"
    set -e argv[1..3]
    __complete_arg $tocomplete "$cmd; and [ (count (__fish_complete_args)) = 1 ]" -a $sub -d $argv
end

function __complete_sub_arg -a tocomplete cmd sub -d "A shortcut for defining subcommand arguments completions"
    set -e argv[1..3]
    # NOTE: $sub can be just a name of a subcommand (or several) or additionally any other condition
    complete -f -c $tocomplete -n "__fish_complete_subcommand $cmd $sub" $argv
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

function completion_functions

end
