function varcache
    if test (count $argv) -lt 3
        echo "Usage: varcache KEY CONTENT EXPIRATION [compressed]"
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
            if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
                echo $$varkey | base64 -D | gunzip
            else
                echo $$varkey
            end
            return 0
        end
    else
        set -U $varkey $content
        set -U $timevarkey (date +%s)
        if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
            echo $content | base64 -D | gunzip
        else
            echo $content
        end
        return 2
    end
end

