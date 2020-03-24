function upload
    argparse --name upload 'u/url=' 'n/name=' 'd/dir' -- $argv[2..-1]

    set -l file_to_upload $argv[1]
    set -l dir_to_upload alinpanaitiu
    if set -q _flag_dir
        set dir_to_upload $_flag_dir
    end

    if test -d $file_to_upload
        zip -9 -r /tmp/(basename $file_to_upload).zip $file_to_upload
        set file_to_upload /tmp/(basename $file_to_upload).zip
    end

    rsync -v -e ssh $file_to_upload noiseblend:/static/$dir_to_upload/$_flag_name
end
