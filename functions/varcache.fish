function varcache_expired
    argparse 't/timevarkey' 'e/expiration' -- $argv
    set cached_at $_flag_timevarkey
    set exp (date -r $cached_at -v +$_flag_expiration +%s)
    echo Cached At $cached_at
    echo Expires at $exp
    test $exp -gt (date +%s)
end

function varcache
    if test (count $argv) -lt 3
        echo "Usage: varcache KEY CMD EXPIRATION [compressed]"
        return 1
    end
    set varkey '__VARCACHE_'(string escape --style var -- $argv[1])
    set timevarkey $varkey'_CACHED_AT'
    set cmd $argv[2]
    set expiration $argv[3]

    if set -q $timevarkey; and varcache_expired -t $$timevarkey -e $expiration
        if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
            echo $$varkey | base64 -D | gunzip
        else
            echo $$varkey
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
    end
end

