function svgtopng
    argparse --name svgtopng 'd/dpi=' -- $argv
    set dpi (set -q _flag_dpi; and echo $_flag_dpi; or echo 200)
    set svg $argv[1]
    set png (set -q argv[2]; and echo $argv[2]; or echo (basename -s .svg $svg).png)

    inkscape \
        --export-filename="$png" --export-dpi=$dpi \
        --export-background-opacity=0 $argv[3..] "$svg"
end
