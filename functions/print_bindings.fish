function print_bindings
    bind | \
    string replace '\e\[D' 'left' | \
    string replace '\e\[C' 'right' | \
    string replace '\e\[A' 'up' | \
    string replace '\e\[B' 'down' | \
    string replace '\[1\;5D' 'left' | \
    string replace '\[1\;5C' 'right' | \
    string replace '\[1\;5A' 'up' | \
    string replace '\[1\;5B' 'down' | \
    string replace '\e' 'alt-' | \
    string replace '\c' 'ctrl-' | \
    string replace '\t' 'tab' | \
    string replace -i 'bind --preset -M paste ' '' | \
    string replace 'bind --preset -k ' '' | \
    string replace 'bind --preset ' '' | \
    string replace -i 'bind -M insert ' '' | \
    sed -E 's/^bind (-k )?//g'
end
