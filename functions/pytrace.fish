function pytrace
    python -m trace --ignore-dir=(python -c 'import sys ; print(":".join(sys.path)[1:])') -t $argv
end
