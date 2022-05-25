function thumb
    argparse --name thumb 's/size=' 'o/outputdir=' c/crop -- $argv

    for filename in $argv
        set -l ext (string match -r '\..+$' $filename)
        set format "%s_$size"
        if set -q _flag_outputdir
            set format $_flag_outputdir
        end

        set restargs
        if set -q _flag_crop
            set restargs $restargs --smartcrop attention
        end

        echo Creating thumbnail for (set_color -o yellow)$filename(set_color normal) at (set_color -o green)$format$ext(set_color normal)

        vipsthumbnail $filename \
            --vips-progress \
            --linear \
            --size=$size \
            --vips-concurrency=(nproc) \
            -o "$format$ext" \
            --delete \
            --rotate $restargs
    end
end
