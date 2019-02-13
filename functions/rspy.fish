function rspy
    rsub (python -c "import $argv[1]; print($argv[1].__file__)")
end
