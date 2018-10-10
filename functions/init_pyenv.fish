function init_pyenv
    set -xg PATH "$HOME/.pyenv/shims" "$HOME/.pyenv/bin" $PATH
    status --is-interactive; and source (pyenv init -|psub)
    status --is-interactive; and source (pyenv virtualenv-init -|psub)
end
