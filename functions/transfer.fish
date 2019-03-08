function transfer --description 'Upload a file to transfer.sh'
    if [ $argv[1] ]
        set -l tmpfile ( mktemp -t transferXXX )
        curl --progress-bar --upload-file "$argv[1]" https://transfer.sh/(basename $argv[1]) >> $tmpfile
        cat $tmpfile
        command rm -f $tmpfile
    else
        echo 'usage: transfer FILE_TO_TRANSFER'
    end
end
