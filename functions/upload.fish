function randomize_filename -a filepath
    set ext (basename $filepath | awk -F . 'index($0, ".") {if (index($0, ".tar.")) {print "."$(NF-1)"."$NF} else {print "."$NF}}')
    set hash (sha1sum $filepath | cut -d' ' -f 1)
    echo "$hash""$ext"
end

function upload
    argparse --name upload 'u/url=' 'n/name=' 'd/dir=' 'r/randomize' -- $argv

    set -l dir_to_upload alinpanaitiu
    if set -q _flag_dir
        set dir_to_upload $_flag_dir
    end

    set -l tld "com"
    if test $dir_to_upload = "lunar"
        set dir_to_upload "Lunar"
    end
    if test $dir_to_upload = "noiseblend"
        set dir_to_upload "Noiseblend"
    end
    if test $dir_to_upload = "Lunar"
        set tld "fyi"
    end
    if test $dir_to_upload = "darkwoods"
        set tld "win"
    end

    for file_to_upload in $argv
        set -l file_to_upload (realpath $file_to_upload)

        if test -d $file_to_upload
            set folder_name (basename $file_to_upload)
            set folder_parent (dirname $file_to_upload)
            set -l zip_file "/tmp/$folder_name.zip"

            cd $file_to_upload
            echo Zipping $file_to_upload to $zip_file
            zip -9 -r $zip_file (ls -A)
            set file_to_upload $zip_file
        end

        set files_to_upload $files_to_upload $file_to_upload
    end

    if test (count $files_to_upload) -eq 1
        set -l filename (basename $files_to_upload[1])
        if set -q _flag_name
            set filename $_flag_name
        else if set -q _flag_randomize
            set filename (randomize_filename "$files_to_upload[1]")
        end

        set -l file_url "https://static."(string lower -- $dir_to_upload)".$tld/$filename"
        echo Uploading (set_color -o yellow)$files_to_upload(set_color normal) to (set_color -o blue)$filename(set_color normal)
        rsync -avzh --progress -L -e ssh $files_to_upload noiseblend:/static/$dir_to_upload/$filename
        echo -n $file_url | pbcopy
        pbpaste
        echo ''
    else
        echo Uploading files to noiseblend:/static/$dir_to_upload/
        set filenames $files_to_upload

        if set -q _flag_randomize
            for i in (seq 1 (count $files_to_upload))
                set filenames[$i] (randomize_filename "$files_to_upload[$i]")

                echo \t(set_color -o yellow)"$files_to_upload[$i]"(set_color normal)'  =>  '(set_color -o blue)"$filenames[$i]"(set_color normal)
                rsync -avzh --progress -L -e ssh "$files_to_upload[$i]" "noiseblend:/static/$dir_to_upload/$filenames[$i]"
            end
        else
            string join \n -- \t$files_to_upload
            rsync -avzh --progress -L -e ssh $files_to_upload noiseblend:/static/$dir_to_upload/
        end

        set -l file_url "https://static."(string lower -- $dir_to_upload)".$tld/"
        string join \n -- $file_url$filenames | pbcopy
        pbpaste
        echo ''
    end
end
