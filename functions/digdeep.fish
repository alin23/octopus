function digdeep -d "Looks for subdomains and tries to resolve them"
    argparse --name "digdeep" "r/reverse" -- $argv

    if set -q _flag_reverse
        mapcidr -cidr $argv[1] -silent | dnsx -silent -ptr -resp-only
    else
        subfinder -silent -d $argv[1] | dnsx -silent -a -aaaa -txt -mx -cname -resp
    end
end