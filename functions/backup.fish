function bkp -a filepath
    set backupPath ~/.backup/(sha1sum $filepath | head -c 6)/(basename $filepath)
    mkdir -p (dirname $backupPath)
    echo Backing up $filepath to $backupPath
    mv $filepath $backupPath
end