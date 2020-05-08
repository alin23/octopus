function print-term-colors
    for i in (seq (tput colors))
        tput setaf $i
        echo -n "$i █  "
    end
    tput setaf 15
    echo
end