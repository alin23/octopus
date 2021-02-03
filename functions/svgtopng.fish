function svgtopng -a svg png
    if empty "$png"
        set png (basename -s .svg $svg).png
    end

    inkscape \
        --export-filename="$png" --export-dpi=200 \
        --export-background-opacity=0 "$svg"
end
