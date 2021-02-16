function pywhich
    argparse --name sspy 'd/dir' -- $argv

    set arg (string replace -a '-' '_' $argv[1])
    set module (python -c "import $arg; print($arg.__file__)")

    if set -q _flag_dir
        echo (dirname $module)
    else
        echo $module
    end
end
