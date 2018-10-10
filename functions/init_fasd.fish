function init_fasd
    if not is_cygwin
        if ps $PPID | grep -q mc
            function _fasd_preexec
                fasd --proc (fasd --sanitize "$argv[1]")
            end
        end
    end
end
