function sspy
    subl (string replace -r '\.pyc$' .py (pywhich $argv[1]))
end
