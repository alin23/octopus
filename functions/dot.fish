function dot -d "Add to dotfiles sync dir" -a path
    set path (string replace -ar '/+$' '' -- "$path")
    set relpath (string replace -ar "^$HOME/+" '' -- "$path")
    set dotfilesPath "$HOME/Dropbox/dotfiles/home/other/$relpath"
    if test -d "$path"
        mkdir -p $dotfilesPath
        set dotfilesPath (dirname "$dotfilesPath")
    else if test -f "$path"
        mkdir -p (dirname $dotfilesPath)
    else
        echo "Path $path does not exist"
        return 1
    end
    rsync -avzL "$path" "$dotfilesPath"
    if not grep -q $relpath "$HOME/Dropbox/dotfiles/home/.stowlist"
        echo "$relpath" >> "$HOME/Dropbox/dotfiles/home/.stowlist"
    end
    $HOME/Dropbox/dotfiles/stow.py other
end
