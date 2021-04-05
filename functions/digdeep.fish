function digdeep -a domain -d "Looks for subdomains and tries to resolve them"
    subfinder -silent -d $domain | dnsx -silent -a -aaaa -txt -mx -cname -resp
end