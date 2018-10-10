function bind_global_alias
    switch (commandline -t)
    case "f"
        commandline -rt '| fzf'
    case "l"
        commandline -rt '| less'
    case "h"
        commandline -rt '| head'
    case "t"
        commandline -rt '| tail'
    case "tf"
        commandline -rt '| tail -f'
    case "g"
        commandline -rt '| grep -i '
    case "w"
        commandline -rt '| wc'
    case "wl"
        commandline -rt '| wc -l'
    case "c"
        commandline -rt '| pbcopy'
    case "n"
        commandline -rt '; echo iTerm command finished: (fc -ln -1)'
    case "x"
        commandline -rt '| xargs -0 -I \{\} echo \'{}\''; and commandline -C (math (commandline -C) - 5)
    end
end
