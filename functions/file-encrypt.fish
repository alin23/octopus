function file-encrypt
    gpg --output "$argv[1].gpg" -r $argv[2] --encrypt $argv[1]
    echo "Encrypted as $argv[1].gpg"
end
