function upload
    argparse --name upload 'u/url=' 'n/name=' 'd/dir=' -- $argv

    set -l dir_to_upload alinpanaitiu
    if set -q _flag_dir
        set dir_to_upload $_flag_dir
    end

    set -l tld "com"
    if test $dir_to_upload = "Lunar"
        set tld "fyi"
    end


    for file_to_upload in $argv
        set -l file_to_upload (realpath $file_to_upload)

        if test -d $file_to_upload
            set -l zip_file /tmp/(basename $file_to_upload).zip

            echo Zipping $file_to_upload to $zip_file
            zip -9 -r $zip_file $file_to_upload
            set file_to_upload $zip_file
        end

        set files_to_upload $files_to_upload $file_to_upload
    end

    if test (count $files_to_upload) -eq 1
        set -l filename (basename $file_to_upload)
        if set -q _flag_name
            set filename $_flag_name
        end

        set -l file_url "https://static.$dir_to_upload.$tld/$filename"
        echo Uploading $files_to_upload to $filename
        rsync -avzh --progress -L -e ssh $files_to_upload noiseblend:/static/$dir_to_upload/$filename
        echo $file_url | pbcopy
        pbpaste
    else
        echo Uploading files to noiseblend:/static/$dir_to_upload/
        string join \n -- \t$files_to_upload
        rsync -avzh --progress -L -e ssh $files_to_upload noiseblend:/static/$dir_to_upload/

        set -l file_url "https://static.$dir_to_upload.$tld/"
        string join \n -- $file_url(basename $files_to_upload) | pbcopy
        pbpaste
        echo ''
    end
end
