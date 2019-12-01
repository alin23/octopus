function transfer -d "Upload to transfer.sh" -a file name maxDownloads maxDays
    set -l tmp (mktemp -t transferXXX)

    set -q maxDownloads[1]
    or set maxDownloads[1] "5"

    set -q maxDays[1]
    or set maxDays[1] "3"

    if test -z "$name"
        if not isatty
            set name $file
        else if test -n "$file"
            set name (basename $file)
        end
    end

    if test -z "$name"
        set name (random)
    end

    if not isatty
        set file ""
    end

    set name (echo "$name" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
    set name (echo "$name" | sed -e 's/-\{1,\}/-/g')

    echo "Uploading $file as $name for $maxDownloads downloads and $maxDays days"
    if test -n "$file"
        if not test -r "$file"
            echo "transfer: can not read the file." > /dev/stderr
            return 1
        end
        curl -H "Max-Downloads: $maxDownloads" -H "Max-Days: $maxDays"  --progress-bar --upload-file $file https://transfer.sh/"$name" >> $tmp
    else
        curl -H "Max-Downloads: $maxDownloads" -H "Max-Days: $maxDays"  --progress-bar --upload-file - https://transfer.sh/"$name" >> $tmp
    end

    if command_exists pbcopy
        tail -n 1 $tmp | pbcopy
    end

    cat $tmp
    rm -f $tmp
end
