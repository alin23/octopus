function addbin
    argparse --name addbin 'u/url=' 'f/file=' 's/symlink=' 'n/binary-name=' -- $argv
    or return 1

    if set -q _flag_binary_name
        set binpath "$HOME/.bin/shared/$_flag_binary_name"
    else
        set binpath "$HOME/.bin/shared/"(basename "$_flag_url$_flag_file")
    end

    if set -q _flag_url
        echo Downloading $_flag_url to $binpath
        wget -O "$binpath" "$_flag_url"
    else if set -q _flag_symlink
        ln -s "$_flag_file" "$binpath"
    else
        cp "$_flag_file" "$binpath"
    end
    chmod +x "$binpath"
end
