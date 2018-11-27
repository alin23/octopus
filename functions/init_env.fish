function init_env
    set -xU PYTHONBREAKPOINT "pudb.set_trace"
    set -xU CLICOLOR "1"
    set -xU GOPATH "$HOME/.go"
    set -xg GPG_TTY (tty)
    set -xU LANG "en_US.UTF-8"
    set -xU LANGUAGE "en_US.UTF-8"
    set -xU LC_ALL "en_US.UTF-8"
    set -xU NODE_ENV "development"

    set -xU FZF_DEFAULT_OPTS \
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
        set -xU VISUAL sublw
        set -xU EDITOR subl

        set -xU OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include
        set -xU OPENSSL_LIB_DIR /usr/local/opt/openssl/lib
        set -xU DEP_OPENSSL_INCLUDE /usr/local/opt/openssl/include
        set -xU ANDROID_HOME $HOME/Library/Android/sdk/
        set -xU ANDROID_SDK_ROOT $HOME/Library/Android/sdk/
        set -xU SCRIPTS "$HOME/Documents/Scripts/Python" "$HOME/Documents/Scripts/Shell" "$HOME/Documents/Scripts/AppleScript"
        set -xg PATH "$HOME/.bin" "$HOME/.cargo/bin" $SCRIPTS "$ANDROID_SDK_ROOT/emulator" "/usr/local/opt/sqlite/bin" "/usr/local/opt/ncurses/bin" "/usr/local/bin" "/usr/local/sbin" $PATH "$HOME/.yarn-config/global/node_modules/.bin" "/usr/local/opt/go/libexec/bin" "$GOPATH/bin" "/usr/local/opt/android-sdk/bin" "$HOME/.local/bin" "/usr/local/opt/coreutils/libexec/gnubin" 2>/dev/null
        set -xg CDPATH "$CDPATH" "$HOME" "$HOME/Projects" "$HOME/Github" "$HOME/Github/*" "$HOME/Gitlab" "$HOME/Gitlab/*" 2>/dev/null
        set -xU PGDATA /usr/local/var/postgres
        command_exists rustc; and set -xU RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"
    else
        if command_exists kak
            set -xU VISUAL kak
            set -xU EDITOR kak
        else if command_exists amp
            set -xU VISUAL amp
            set -xU EDITOR amp
        else
            set -xU VISUAL nano
            set -xU EDITOR vim
        end

        set -xg CDPATH "." "$CDPATH" "$HOME" "$HOME/Projects" "$HOME/Github" "$HOME/Github/alin23" "$HOME/Gitlab" "$HOME/Gitlab/alin23" 2>/dev/null
        set -xg PATH "$HOME/.bin" "$HOME/.cargo/bin" "/snap/bin" $PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" "$GOPATH/bin" "/usr/sbin" "/sbin" 2>/dev/null
        set -xg MANPATH "/home/linuxbrew/.linuxbrew/share/man" "$MANPATH"
        set -xg INFOPATH "/home/linuxbrew/.linuxbrew/share/info" "$INFOPATH"
    end
    if test -d $HOME/n
        set -xU N_PREFIX $HOME/n
        set -xg PATH $N_PREFIX/bin $PATH
    end
    set -xU LPASS_AGENT_TIMEOUT 0
end