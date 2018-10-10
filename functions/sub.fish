function sub
    set -l rest $argv[3..-1]
    rename -X -s $argv[1] $argv[2] $rest
end
