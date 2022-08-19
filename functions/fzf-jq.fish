function fzf-jq -d "Jq with fzf live preview" -a url
    set json /tmp/fzf-jq.json
    if empty "$url"
        read -z >$json
    else if test -f $url
        set json (string escape -n -- "$url")
    else
        curl -sL "$url" >$json
    end

    echo '' | fzf --print-query --preview-window=up,99% --preview "cat $json | begin jq {q} || cat $json; end | bat -l json -f"
end
