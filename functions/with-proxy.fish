function fzf-jq -d "Jq with fzf live preview"
    set json (string escape -n -- $argv)
    echo '' | fzf --print-query --preview "cat $json | jq {q}"
end
