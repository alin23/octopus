function sspy
    subl (python -c "import $argv[1]; print($argv[1].__file__)")
end
