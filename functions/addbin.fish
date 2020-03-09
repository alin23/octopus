function addbin
    argparse -x url,file 'u/url=' 'f/file=' 'n/name=?' -- $argv
    or return 1

    if set -q _flag_name
        set binary_name $_flag_name
    else
        set binary_name (basename "$_flag_url$_flag_file")
    end

    if set -q _flag_url
        wget -O "$HOME/.bin/shared/$_flag_name" "$_flag_url"
    else
        cp $_flag_file "$HOME/.bin/shared/$_flag_name"
    end
    chmod +x $HOME/.bin/shared/*
end
