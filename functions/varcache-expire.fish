function varcache-expire
    if test (count $argv) -eq 0
        echo "Usage: varcache KEY"
        return 1
    end

    set varkey '__VARCACHE_'(string escape --style var -- $argv[1])
    set timevarkey $varkey'_CACHED_AT'

    set -e $varkey
    set -e $timevarkey
end
