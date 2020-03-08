function varcache
    if test (count $argv) -lt 3
        echo "Usage: varcache KEY CONTENT EXPIRATION"
        return 1
    end
    set varkey '__VARCACHE_'(string escape --style var -- $argv[1])
    set timevarkey $varkey'_CACHED_AT'
    set content $argv[2]
    set expiration $argv[3]

    if set -q $timevarkey
        set cached_at $$timevarkey
        set exp (date -v +$expiration +%s)
        if test $exp -gt $cached_at
            echo $$varkey
            return 0
        end
    else
        set -U $varkey $content
        set -U $timevarkey (date +%s)
        echo $content
        return 2
    end
end

