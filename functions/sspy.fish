function sspy
    argparse --name sspy 'd/dir' -- $argv
    set module (string replace -r '\.pyc$' .py (pywhich $argv[1]))

    if set -q _flag_dir
        $EDITOR (dirname $module)
    else
        $EDITOR $module
    end
end
