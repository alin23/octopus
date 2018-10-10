function is_cygwin
    set -q OSTYPE
    or set -U OSTYPE (uname)

    string match -q "CYGWIN*" $OSTYPE
end