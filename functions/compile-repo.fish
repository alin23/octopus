function compile-repo -a repo
    argparse -n compile-repo 'c/cmake' 'i/install' -- $argv
    cl $repo

    if set -q _flag_cmake
        mkd build
        cmake ..
        make -j(nproc)
    else
        autoreconf -if
        ./configure
        make -j(nproc)
    end

    if set -q _flag_install
        sudo make install
    end
end