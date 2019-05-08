function source_rbenv
    source (rbenv init -|psub)
end

function init_rbenv
    if not command_exists rbenv
        set -xg PATH "$HOME/.rbenv/shims" "$HOME/.rbenv/bin" $PATH
        if status --is-interactive
            source_rbenv &
        end
    end
end
