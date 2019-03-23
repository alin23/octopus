function set_rust_src_path
    command_exists rustc; and set -xg RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"
end

function init_env
    set -xg LESSCHARSET utf-8
    set -xg PYTHONBREAKPOINT "pudb.set_trace"
    set -xg CLICOLOR "1"
    set -xg GOPATH "$HOME/.go"
    set -xg GPG_TTY (tty)
    set -xg LANG "en_US.UTF-8"
    set -xg LANGUAGE "en_US.UTF-8"
    set -xg LC_ALL "en_US.UTF-8"
    set -xg NODE_ENV "development"

    set -xg FZF_DEFAULT_OPTS \
'--color fg:15,bg:-1,hl:13,fg+:6,bg+:0,hl+:11,'\
'info:3,prompt:3,spinner:7,pointer:3,marker:9 '\
'--bind \''\
'alt-o:execute(open {}),'\
'alt-d:execute(cd (dirname {})),'\
'alt-s:execute(subl {}),'\
'alt-t:execute(tail -f -n 20 {}),'\
'alt-l:execute(less -f {}),'\
'alt-c:execute-silent(echo {} | pbcopy)+abort\''

    if is_darwin
        set -xg VISUAL sublw
        set -xg EDITOR subl

        set -xg OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include
        set -xg OPENSSL_LIB_DIR /usr/local/opt/openssl/lib
        set -xg DEP_OPENSSL_INCLUDE /usr/local/opt/openssl/include
        set -xg ANDROID_HOME $HOME/Library/Android/sdk/
        set -xg ANDROID_SDK_ROOT $HOME/Library/Android/sdk/
        set -xg SCRIPTS "$HOME/Documents/Scripts/Python" "$HOME/Documents/Scripts/Shell" "$HOME/Documents/Scripts/AppleScript"
        set -xg PATH "$HOME/.bin" "$HOME/.cargo/bin" $SCRIPTS "$ANDROID_SDK_ROOT/emulator" "/usr/local/opt/sqlite/bin" "/usr/local/opt/ncurses/bin" "/usr/local/bin" "/usr/local/sbin" $PATH "$HOME/.yarn-config/global/node_modules/.bin" "/usr/local/opt/go/libexec/bin" "$GOPATH/bin" "/usr/local/opt/android-sdk/bin" "$HOME/.local/bin" "/usr/local/opt/coreutils/libexec/gnubin" 2>/dev/null
        set -xg PGDATA /usr/local/var/postgres
        set_rust_src_path &
    else
        if command_exists kak
            set -xg VISUAL kak
            set -xg EDITOR kak
        else if command_exists amp
            set -xg VISUAL amp
            set -xg EDITOR amp
        else
            set -xg VISUAL nano
            set -xg EDITOR vim
        end

        set -xg PATH "$HOME/.bin" "$HOME/.cargo/bin" "/snap/bin" $PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" "$GOPATH/bin" "/usr/sbin" "/sbin" 2>/dev/null
        set -xg MANPATH "/home/linuxbrew/.linuxbrew/share/man" "$MANPATH"
        set -xg INFOPATH "/home/linuxbrew/.linuxbrew/share/info" "$INFOPATH"
    end
    set -xg CDPATH "." "$CDPATH" "$HOME" "$HOME/Projects" "$HOME/.config" "$HOME/Github" (list_top_dirs $HOME/Github) "$HOME/Gitlab" (list_top_dirs $HOME/Gitlab) 2>/dev/null

    if test -d $HOME/n
        set -xg N_PREFIX $HOME/n
        set -xg PATH $N_PREFIX/bin $PATH
    end
    set -xg LPASS_AGENT_TIMEOUT 0
end

function list_top_dirs
    if test -d $argv[1]
        find $argv[1] -maxdepth 1 -and -type d | sort
    end
end