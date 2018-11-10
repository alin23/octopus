function showmail
    set -xU MAIL_FILE /var/mail/$USER
    if [ -s $MAIL_FILE ]
        cat $MAIL_FILE
        truncate $MAIL_FILE --size 0
    end
end
