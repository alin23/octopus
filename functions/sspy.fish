function sspy
    argparse --name sspy 'd/dir' 'r/remote' -- $argv
    set module (string replace -r '\.pyc$' .py (pywhich $argv[1]))

    if set -q _flag_remote
        set subl (which rsub)
    else
        set subl (which subl)
    end

    if set -q _flag_dir
        $subl (dirname $module)
    else
        $subl $module
    end
end
