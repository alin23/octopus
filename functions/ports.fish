function ports
    if set -q argv[1]
        lsof -PiTCP -sTCP:LISTEN | grep -i $argv[1]
    else
        lsof -PiTCP -sTCP:LISTEN
    end
end
