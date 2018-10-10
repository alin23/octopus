function is_linux
    set -q OSTYPE
    or set -U OSTYPE (uname)

    test $OSTYPE = Linux
end