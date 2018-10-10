function suf
    set -l rest $argv[2..-1]
    rename -X -a $argv[1] $rest
end
