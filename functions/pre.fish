function pre
    set -l rest $argv[2..-1]
    rename -X -A $argv[1] $rest
end
