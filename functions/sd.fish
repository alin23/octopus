function sd -a text replacement folder
    if empty "$folder"
        set folder (pwd)
    end

    set files (rg $argv -l "$text" "$folder")
    command sd "$text" "$replacement" $files
end
