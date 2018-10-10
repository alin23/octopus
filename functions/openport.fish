function openport
    set internal $argv[1]
    if [ (count $argv) -eq 2 ]
        set external $argv[2]
    else
        set external $argv[1]
    end

    geo -l|read ip
    upnpc -a $ip $internal $external tcp
end
