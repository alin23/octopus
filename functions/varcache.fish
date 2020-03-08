function varcache
    if test (count $argv) -lt 3
        echo "Usage: varcache KEY CMD EXPIRATION [compressed]"
        return 1
    end
    set varkey '__VARCACHE_'(string escape --style var -- $argv[1])
    set timevarkey $varkey'_CACHED_AT'
    set cmd $argv[2]
    set expiration $argv[3]

    if set -q $timevarkey
        set cached_at $$timevarkey
        set exp (date -v +$expiration +%s)
        echo Cached At $cached_at
        echo Expires at $exp
        if test $exp -gt $cached_at
            if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
                echo $$varkey | base64 -D | gunzip
            else
                echo $$varkey
            end
            return 0
        end
    else
        if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
            set cmd $cmd' | gzip | base64'
        end

        set content (eval $cmd)
        set -U $varkey $content
        set -U $timevarkey (date +%s)
        if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
            echo $content | base64 -D | gunzip
        else
            echo $content
        end
        return 0
    end
end

