function del
    set -l rest $argv[2..-1]
    rename -X -s $argv[1] '' $rest
end
