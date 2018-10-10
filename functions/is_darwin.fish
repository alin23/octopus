function is_darwin
    set -q OSTYPE
    or set -U OSTYPE (uname)

    test $OSTYPE = Darwin
end