function fzf-hq -d "htmlq with fzf live preview" -a url
    set html /tmp/fzf-hq.html
    if empty "$url"
        read -z >$html
    else if test -f $url
        set html (string escape -n -- "$url")
    else
        curl -sL "$url" >$html
    end

    echo '' | fzf --print-query --preview-window=up,99% --preview "cat $html | begin htmlq {q} || cat $html; end | bat -l html -f"
end
