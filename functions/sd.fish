function sd -a text replacement folder
    if empty "$folder"
        set folder (pwd)
    end

    set files (rg $argv[4..-1] -l "$text" "$folder")
    if empty $files
        return 1
    end
    command sd "$text" "$replacement" $files
end
