function fzf-jq -d "Jq with fzf live preview"
    echo '' | fzf --print-query --preview "cat $argv | jq {q}"
end
