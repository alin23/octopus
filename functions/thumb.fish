function thumb -a filename size output
    set -l ext (string match -r '\..+$' $filename)
    set format "%s_$size"
    if set -q argv[3]
        set format $output
    end
    vipsthumbnail $filename \
        --vips-progress \
        --linear \
        --size=$size \
        --vips-concurrency=4 \
        -o "$format$ext" \
        --eprofile='/System/Library/ColorSync/Profiles/sRGB Profile.icc' \
        --delete \
        --rotate
end
