function current_file_or_bin
    set val (eval echo (commandline -t))
    if not test -e "$val"; and command_exists "$val"
        set val (which "$val")
    end
    echo -n $val
end