function source_pyenv
    source (pyenv init -|psub)
    source (pyenv virtualenv-init -|psub)
end

function init_pyenv
    set -xg PATH "$HOME/.pyenv/shims" "$HOME/.pyenv/bin" $PATH
    if status --is-interactive
        source_pyenv &
    end
end
