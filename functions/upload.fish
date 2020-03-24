function pyenv-run
    if pyenv shell $argv[1]
        eval $argv[2..-1]
        pyenv shell -
    end
end
