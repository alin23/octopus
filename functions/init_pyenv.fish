function source_pyenv
    source (pyenv init -|psub)
    source (pyenv virtualenv-init -|psub)
end

function init_pyenv
    if not command_exists pyenv
        set -xg PATH "$HOME/.pyenv/shims" "$HOME/.pyenv/bin" $PATH
    end
    if status --is-interactive; and command_exists pyenv
        source_pyenv &
    end
end
