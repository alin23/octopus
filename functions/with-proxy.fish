function with-proxy -d "Run command with proxy"
    set -xg https_proxy (shuf -n 1 ~/Documents/http_proxies.txt)
    set -xg http_proxy $https_proxy

    while not $argv
        echo Retrying request
        set -xg https_proxy (shuf -n 1 ~/Documents/http_proxies.txt)
        set -xg http_proxy $https_proxy
    end
end
