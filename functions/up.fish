function up --wraps lift
    argparse --name up 's/site=' 'a/args=' -- $argv

    set site "darkwoods.win"
    if set -q _flag_site
        set site $_flag_site
    end

    if string match -q 'lun*' "$site"
        set site f.lunar.fyi
    end
    if string match -q 'noise*' "$site"
        set site f.noiseblend.com
    end
    if string match -q 'alin*' "$site"
        set site f.alinpanaitiu.com
    end
    if string match -q 'dark*' "$site"
        set site f.darkwoods.win
    end
    if string match -q 'sub*' "$site"
        set site f.subsol.one
    end
    if string match -q 'low*' "$site" || string match -q 'ltg*' "$site"
        set site f.lowtechguys.com
    end

    set -q _flag_args || set _flag_args ""

    if not empty $_flag_args
        lift (string split ' ' -- $_flag_args) -h $site -n $argv
    else
        lift -h $site -n $argv
    end
end

set _up_sites 'lunar lowtechguys darkwoods alinpanaitiu noiseblend'
complete -c up -n "not __fish_seen_subcommand_from $_up_sites" -f -a $_up_sites
complete -c up -n "__fish_seen_subcommand_from $_up_sites" -F
