function init_abbr
    abbr -a o open
    abbr -a mux tmuxinator
    abbr -a sx 'sshmux'
    abbr -a sxc 'sshmux -CC'

    # Package manager
    if not is_cygwin
        abbr -a i 'brew install'
        abbr -a ci 'brew cask install'
        abbr -a nf 'brew info'
        abbr -a s 'brew search'
        abbr -a cs 'brew search'
        abbr -a u 'brew uninstall'
        abbr -a bup 'brew update; and brew upgrade'
        abbr -a cnf 'brew cask info'
        abbr -a cu 'brew cask uninstall'
        abbr -a cup 'brew cu'
    else
        abbr -a i 'apt-cyg install'
        abbr -a nf 'apt-cyg show'
        abbr -a s 'apt-cyg search'
        abbr -a u 'apt-cyg remove'
        abbr -a aup 'apt-cyg update'
    end

    if not is_darwin
        abbr -a sx 'sshmux'
        abbr -a ai 'sudo apt install -y'
        abbr -a as 'apt search'
        abbr -a au 'sudo apt remove'
        abbr -a aup 'sudo apt update; and sudo apt full-upgrade'
    end

    # OS Specific
    if not is_darwin; and [ ! -d $HOME/.pyenv ]
        abbr -a pip 'sudo -H pip'
        abbr -a pip2 'sudo -H pip2'
    end

    if is_darwin
        abbr -a caff 'caffeinate -ism'
        abbr -a sslflags 'CFLAGS=\"-I/usr/local/opt/openssl/include -O2\" LDFLAGS=\"-L/usr/local/opt/openssl/lib\"'
        abbr -a svc 'brew services'
        abbr -a svcs 'brew services start'
        abbr -a svcr 'brew services restart'
        abbr -a svcp 'brew services stop'
        abbr -a kl 'sudo pkill -9 -f -l'
    else
        abbr -a svc 'systemctl --user'
        abbr -a svcs 'systemctl --user start'
        abbr -a svcr 'systemctl --user restart'
        abbr -a svcp 'systemctl --user stop'
        abbr -a svct 'systemctl --user status'
        abbr -a svcd 'systemctl --user daemon-reload'
        abbr -a svcl 'journalctl -f -n 100 --user-unit'
        abbr -a svclc 'journalctl -f -n 100 --output cat --user-unit'

        abbr -a ssvc 'sudo systemctl'
        abbr -a ssvcs 'sudo systemctl start'
        abbr -a ssvcr 'sudo systemctl restart'
        abbr -a ssvcp 'sudo systemctl stop'
        abbr -a ssvct 'sudo systemctl status'
        abbr -a ssvcd 'sudo systemctl daemon-reload'
        abbr -a ssvcl 'sudo journalctl -f -n 100 -u'
        abbr -a ssvclc 'sudo journalctl -f -n 100 --output cat -u'
        abbr -a kl 'sudo pkill -9 -f -e'
    end


    # Git
    abbr -a gb 'git branch'
    abbr -a gbr 'git branch -r'
    abbr -a gba 'git branch -a'
    abbr -a gbl 'git branch -l'
    abbr -a gbc 'git branch -c'
    abbr -a gbm 'git branch -m'
    abbr -a gbd 'git branch -d'
    abbr -a gbdd 'git branch -D'

    abbr -a gcp 'git cherry-pick'
    abbr -a gcpa 'git cherry-pick --abort'
    abbr -a gcpc 'git cherry-pick --continue'
    abbr -a gcpn 'git cherry-pick --no-commit'

    abbr -a gpl 'git pull'
    abbr -a gplr 'git pull --rebase'

    abbr -a gps 'git push'
    abbr -a gpf 'git push --force'
    abbr -a gpc 'git push --set-upstream origin (git symbolic-ref --short HEAD 2>/dev/null)'
    abbr -a gco 'git checkout'
    abbr -a gcom 'git checkout master'
    abbr -a gcod 'git checkout develop'

    abbr -a ga 'git add'
    abbr -a gaa 'git add .'

    abbr -a gdf 'git difftool'
    abbr -a gd 'git diff'

    abbr -a gl 'git log'

    abbr -a grs 'git reset'
    abbr -a grsh 'git reset --hard'
    abbr -a grsh1 'git reset --hard HEAD~1'
    abbr -a grsh2 'git reset --hard HEAD~2'
    abbr -a grsh3 'git reset --hard HEAD~3'

    abbr -a grr 'git rm'
    abbr -a grrf 'git rm --force'
    abbr -a grrc 'git rm --cached'

    abbr -a gm 'git remote'
    abbr -a gma 'git remote add'
    abbr -a gmo 'git remote get-url origin'
    abbr -a gmso 'git remote set-url origin'

    abbr -a gf 'git fetch'
    abbr -a gfa 'git fetch --all'

    abbr -a gcl 'git clean'
    abbr -a gclf 'git clean -f'
    abbr -a gcld 'git clean -d'

    abbr -a gc 'git commit --verbose'
    abbr -a gcn 'git commit --no-verify --verbose'
    abbr -a gcm 'git commit --verbose --message'
    abbr -a gca 'git add .; git commit --verbose'
    abbr -a gcan 'git add .; git commit --no-verify --verbose'
    abbr -a gcam 'git add .; git commit --verbose --message'
    abbr -a gcamn 'git add .; git commit --verbose --message --no-verify'
    abbr -a gcd 'git commit --amend --verbose'
    abbr -a gcad 'git add .; git commit --amend --verbose --no-edit'
    abbr -a gcadn 'git add .; git commit --amend --verbose --no-edit --no-verify'
    abbr -a gcdm 'git commit --amend --verbose --message'
    abbr -a gcadm 'git add .; git commit --amend --verbose --message'
    abbr -a gcadmn 'git add .; git commit --amend --verbose --message --no-verify'

    abbr -a gr 'git rebase'
    abbr -a gra 'git rebase --abort'
    abbr -a grc 'git rebase --continue'
    abbr -a grm 'git rebase master'
    abbr -a grd 'git rebase develop'
    abbr -a gitall 'ls -d */| xargs -P10 -I\{\} git -C \{\}'
    abbr -a gst 'git status'

    abbr -a gs 'git stash'
    abbr -a gsl 'git stash list'
    abbr -a gsp 'git stash pop'
    abbr -a gsa 'git stash apply'
    abbr -a gss 'git stash show'
    abbr -a gsd 'git stash drop'

    # Python
    abbr -a pipi 'pip install -U --upgrade-strategy=eager'
    abbr -a pipr 'pip install -U --upgrade-strategy=eager -r'
    abbr -a pipe 'pip install -U --upgrade-strategy=eager -e .'
    abbr -a pipreq 'pip install -r requirements.txt -U --upgrade-strategy=eager'
    abbr -a pipdev 'pip install -r requirements-dev.txt -U --upgrade-strategy=eager'
    abbr -a pipu 'pip uninstall'
    abbr -a pips 'pip search'

    abbr -a pipi3 'pip3 install -U --upgrade-strategy=eager'
    abbr -a pipr3 'pip3 install -U --upgrade-strategy=eager -r'
    abbr -a pipe3 'pip3 install -U --upgrade-strategy=eager -e .'
    abbr -a pipreq3 'pip3 install -r requirements.txt -U --upgrade-strategy=eager'
    abbr -a pipdev3 'pip3 install -r requirements-dev.txt -U --upgrade-strategy=eager'
    abbr -a pipu3 'pip3 uninstall'
    abbr -a pips3 'pip3 search'

    abbr -a ptn 'pytest -s -p no:warnings'
    abbr -a ptb 'pytest -s -p no:warnings --pudb -k'
    abbr -a pytb 'rainbow -f pytb --'
    abbr -a ipy 'ipython'
    abbr -a ipyml 'ipython --profile=ml'
    abbr -a ipysp 'ipython --profile=spfy'
    abbr -a ipyspa 'ipython --profile=spfy_async'

    abbr -a hfix 'hatch grow fix; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (fix)"; and git push'
    abbr -a hmin 'hatch grow minor; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (minor)"; and git push'
    abbr -a hmaj 'hatch grow major; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (major)"; and git push'
    abbr -a hrel 'hatch build; and hatch release'

    # Sublime
    abbr -a ss 'subl'
    abbr -a rs 'rsub'
    abbr -a srs 'sudo rsub -f'

    # Kakoune
    abbr -a k 'kak'
    abbr -a sk 'sudo kak'

    abbr -a tf 'tail -f -n 20'
    abbr -a f 'find . -iname '
    abbr -a mcr 'sudo mc -u'
    abbr -a own 'sudo chown (whoami)'
    abbr -a ownall 'sudo chown -R (whoami)'
    abbr -a reload 'source $HOME/.config/fish/config.fish'
    abbr -a stop 'sudo htop'
    abbr -a ydl 'youtube-dl'
    abbr -a zshc 'subl $HOME/.zshrc; and subl $HOME/.zpreztorc'
    abbr -a fishc 'subl $HOME/.config/fish/config.fish'
    abbr -a wgetext '\wget -r -l1 -t1 -nd -N -np -erobots=off -A.pdf'
    abbr -a vlc '/Applications/VLC.app/Contents/MacOS/VLC'
    abbr -a q 'chunkc tiling::query'
    command_exists zou
      and alias wget=zou
    command_exists bat
      and alias cat=bat
    command_exists rural
      and alias http=rural
      and alias h=rural
    command_exists exa
      and alias ls=exa
      and alias l=exa
      and alias ll='exa -l'
      and alias la='exa -la'
      and alias lt='exa -l -T'
    command_exists truncate
      or alias truncate="gtruncate"
    alias tac=gtac

    command_exists sga-ssh
      and alias mosh="mosh --ssh=sga-ssh"
end
