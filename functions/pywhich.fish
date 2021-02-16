function pywhich
    argparse --name sspy 'd/dir' -- $argv

    set module (python -c "import $argv[1]; print($argv[1].__file__)")

    if set -q _flag_dir
        echo (dirname $module)
    else
        echo $module
    end
end
