function upload
    set -l file_to_upload $argv[1]
    argparse --name upload 'u/url=' 'n/name=' 'd/dir' -- $argv[2..-1]

    set -l dir_to_upload alinpanaitiu
    if set -q _flag_dir
        set dir_to_upload $_flag_dir
    end

    echo $file_to_upload
    echo $dir_to_upload
    return 0
    if test -d $file_to_upload
        zip -9 -r /tmp/(basename $file_to_upload).zip $file_to_upload
        set file_to_upload /tmp/(basename $file_to_upload).zip
    end

    set -l tld "com"
    if test $dir_to_upload = "Lunar"
        set tld "fyi"
    end

    set -l filename (basename $file_to_upload)
    if set -q _flag_name
        set filename $_flag_name
    end

    rsync -v -e ssh $file_to_upload noiseblend:/static/$dir_to_upload/$filename
    pbcopy "https://static.$dir_to_upload.$tld/$filename"
end
