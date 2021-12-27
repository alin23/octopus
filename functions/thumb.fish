function thumb
    set -l ext (string match -r '\..+$' $argv[1])
    set format "%s_"(basename -s $ext "$argv[1]")
    if set -q argv[3]
        set format $argv[3]
    end
    vipsthumbnail $argv[1] \
        --vips-progress \
        --linear \
        --size=$argv[2] \
        --vips-concurrency=4 \
        -o "$format$ext" \
        --eprofile='/System/Library/ColorSync/Profiles/sRGB Profile.icc' \
        --delete \
        --rotate
end
