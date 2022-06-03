function sdf -a text replacement folder
    if empty "$folder"
        set folder (pwd)
    end

    set files (rg $argv[4..-1] -l "$text" "$folder" | string collect)
    if empty $files
        return 1
    end
    echo $files | sad --unified 5 --pager 'sh -c "delta -w $FZF_PREVIEW_COLUMNS"' "$text" "$replacement"
end
