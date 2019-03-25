function cargover
    find ~/.cargo -name "Cargo.toml" | xargs rg "$argv[1] ="
end
