function addbin
    argparse --name addbin -x url,file -x n 'u/url=' 'f/file=' 'n/binary-name=?' -- $argv
    or return 1

    if set -q _flag_binary_name
        set binpath "$HOME/.bin/shared/$_flag_binary_name"
    else
        set binpath "$HOME/.bin/shared/"(basename "$_flag_url$_flag_file")
    end

    if set -q _flag_url
        echo Downloading $_flag_url to $binpath
        wget -O "$binpath" "$_flag_url"
    else
        cp "$_flag_file" "$binpath"
    end
    chmod +x "$binpath"
end
