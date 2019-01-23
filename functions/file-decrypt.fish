function file-decrypt
    set -l DECRYPTED_FILENAME (string replace -r '\.gpg$' '' $argv[1])
    if test $status -eq 1
        set DECRYPTED_FILENAME "$argv[1].decrypted"
    end
    gpg --output $DECRYPTED_FILENAME --decrypt $argv[1]
end
