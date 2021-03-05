function reqtime --argument url
    curl --silent --trace-time --output /dev/null --show-error --write-out '
    '(set_color -o red)'lookup:'(set_color normal)'        %{time_namelookup}
    '(set_color -o yellow)'connect:'(set_color normal)'       %{time_connect}
    '(set_color -o cyan)'appconnect:'(set_color normal)'    %{time_appconnect}
    '(set_color -o magenta)'pretransfer:'(set_color normal)'   %{time_pretransfer}
    '(set_color -o brred)'redirect:'(set_color normal)'      %{time_redirect}
    '(set_color -o green)'starttransfer:'(set_color normal)' %{time_starttransfer}
    '(set_color -o blue)'total:'(set_color normal)'         %{time_total}
    ' -L $url
    echo ""
    curl --silent --trace-time --output /dev/null --show-error --write-out '
    '(set_color -o red)'lookup:'(set_color normal)'        %{time_namelookup}
    '(set_color -o yellow)'connect:'(set_color normal)'       %{time_connect}
    '(set_color -o cyan)'appconnect:'(set_color normal)'    %{time_appconnect}
    '(set_color -o magenta)'pretransfer:'(set_color normal)'   %{time_pretransfer}
    '(set_color -o brred)'redirect:'(set_color normal)'      %{time_redirect}
    '(set_color -o green)'starttransfer:'(set_color normal)' %{time_starttransfer}
    '(set_color -o blue)'total:'(set_color normal)'         %{time_total}
    ' -L $url
end