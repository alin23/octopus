function varcache_expired
    argparse 'c/cachedat=' 'e/expiration=' -- $argv
    # set exp (date -r $_flag_cachedat -v +$_flag_expiration +%s)
    set exp ($_date_command -d ($_date_command -d "@$_flag_cachedat")"+$_flag_expiration" +%s)
    test $exp -gt (date +%s)
end

function varcache
    if test (count $argv) -lt 3 || test -z "$argv[2]"
        echo "Usage: varcache KEY CMD EXPIRATION [compressed]"
        return 1
    end
    set varkey '__VARCACHE_'(string escape --style var -- $argv[1])
    set timevarkey $varkey'_CACHED_AT'
    set cmd $argv[2]
    set expiration $argv[3]

    if set -q $timevarkey; and varcache_expired -c $$timevarkey -e $expiration
        if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
            echo $$varkey | $_base64_command -d | gunzip
        else
            echo $$varkey
        end
    else
        if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
            set cmd $cmd" | gzip | $_base64_command -w0"
        end

        set content (eval $cmd)
        set -U $varkey $content
        set -U $timevarkey ($_date_command +%s)
        if test (count $argv) -ge 4; and test "$argv[4]" = "compressed"
            echo $content | $_base64_command -d | gunzip
        else
            echo $content
        end
    end
end

