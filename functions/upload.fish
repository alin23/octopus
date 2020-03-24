function upload
    set -l file_to_upload $argv[1]
    argparse --name upload 'u/url=' 'n/name=' 'd/dir' -- $argv[2..-1]

    set -l dir_to_upload alinpanaitiu
    if set -q _flag_dir
        set dir_to_upload $_flag_dir
    end

    if test -d $file_to_upload
        set -l zip_file /tmp/(basename $file_to_upload).zip

        echo Zipping $file_to_upload to $zip_file
        zip -9 -r $zip_file $file_to_upload
        set file_to_upload $zip_file
    end

    set -l tld "com"
    if test $dir_to_upload = "Lunar"
        set tld "fyi"
    end

    set -l filename (basename $file_to_upload)
    if set -q _flag_name
        set filename $_flag_name
    end

    set -l file_url "https://static.$dir_to_upload.$tld/$filename"
    echo Uploading $file_to_upload to noiseblend:/static/$dir_to_upload/$filename
    rsync -v -e ssh $file_to_upload noiseblend:/static/$dir_to_upload/$filename
    echo $file_url | pbcopy
    echo $file_url
end
