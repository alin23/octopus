function z
    if test (count $argv) -gt 0
        set _Z_RESULT (zoxide query $argv)
        if test -n "$_Z_RESULT"
            if string match -qr -- "query: .+" "$_Z_RESULT"
                cd (string sub -s 8 -- "$_Z_RESULT")
            else
                cd "$_Z_RESULT"
            end
            commandline -f repaint
        end
    end
end

