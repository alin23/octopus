function blurvideo
    if not set -q argv[2]
        set argv[2] 10
    end
    ffmpeg -i $argv[1] -vf "boxblur=$argv[2]:$argv[2]" -movflags +faststart -codec:a copy "blurred-$argv[1]"
end
