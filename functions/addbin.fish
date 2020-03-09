function addbin
    argparse -x url,file 'u/url=' 'f/file=' 'n/name=?' -- $argv
    or return 1

    if set -q _flag_url
        wget $_flag_url -O $HOME/.bin/shared/$_flag_name
    else
        cp $_flag_file $HOME/.bin/shared/$_flag_name
    end
    chmod +x $HOME/.bin/shared/*
end
