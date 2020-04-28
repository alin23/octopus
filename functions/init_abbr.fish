function init_abbr
    if command_exists open
        abbr -a o open
    else if command_exists xdg-open
        abbr -a o xdg-open
    end

    if command_exists tmuxinator
        abbr -a mux tmuxinator
    end

    if command_exists et
        abbr -a ett 'et -x -f -r 52698:52698'
        abbr -a ex 'env LC_NO_FISH_INIT=1 et -x -f -r 52698:52698 -N -c "tmux a || tmux"'
    end
    if command_exists sshmux
        abbr -a sx 'sshmux'
        abbr -a sxc 'sshmux -CC'
    end

    # Package manager
    if command_exists brew
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
    end
    if command_exists apt-cyg
        abbr -a i 'apt-cyg install'
        abbr -a nf 'apt-cyg show'
        abbr -a s 'apt-cyg search'
        abbr -a u 'apt-cyg remove'
        abbr -a aup 'apt-cyg update'
    end

    if command_exists apt
        abbr -a ai 'sudo apt install -y'
        abbr -a as 'apt search'
        abbr -a au 'sudo apt remove'
        abbr -a aup 'sudo apt update; and sudo apt full-upgrade'
    end
    if command_exists yum
        abbr -a yi 'sudo yum install -y'
        abbr -a ys 'yum search'
        abbr -a yu 'sudo yum remove'
        abbr -a yup 'sudo yum update'
    end

    # OS Specific
    if is_darwin
        abbr -a kl 'sudo pkill -9 -f -l'
    else
        abbr -a kl 'sudo pkill -9 -f -e'
    end

    if not is_darwin
        and not test -d $HOME/.pyenv
        abbr -a pip 'sudo -H pip'
        abbr -a pip2 'sudo -H pip2'
    end

    if command_exists caffeinate
        abbr -a caff 'caffeinate -ism'
    end

    if command_exists brew
        abbr -a bsc 'brew services'
        abbr -a bscs 'brew services start'
        abbr -a bscr 'brew services restart'
        abbr -a bscp 'brew services stop'
    end
    if command_exists systemctl
        abbr -a suc 'systemctl --user'
        abbr -a sucs 'systemctl --user start'
        abbr -a suced 'systemctl --user edit'
        abbr -a sucen 'systemctl --user enable'
        abbr -a sucdd 'systemctl --user disable'
        abbr -a sucr 'systemctl --user restart'
        abbr -a succ 'systemctl --user cat'
        abbr -a sucp 'systemctl --user stop'
        abbr -a suct 'systemctl --user status'
        abbr -a sucd 'systemctl --user daemon-reload'
        abbr -a sucl 'journalctl -f -n 100 --user-unit'
        abbr -a suclc 'journalctl -f -n 100 --output cat --user-unit'

        abbr -a sc 'sudo systemctl'
        abbr -a scs 'sudo systemctl start'
        abbr -a sced 'sudo systemctl edit'
        abbr -a scen 'sudo systemctl enable'
        abbr -a scdd 'sudo systemctl disable'
        abbr -a scr 'sudo systemctl restart'
        abbr -a scc 'sudo systemctl cat'
        abbr -a scp 'sudo systemctl stop'
        abbr -a sct 'sudo systemctl status'
        abbr -a scd 'sudo systemctl daemon-reload'
        abbr -a scl 'sudo journalctl -f -n 100 -u'
        abbr -a sclc 'sudo journalctl -f -n 100 --output cat -u'
    end


    # Git
    if command_exists git
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
        abbr -a gcb 'git checkout -b'
        abbr -a gcom 'git checkout master'
        abbr -a gcod 'git checkout develop'

        abbr -a ga 'git add'
        abbr -a gaa 'git add .'

        abbr -a gdfc 'git difftool --cached'
        abbr -a gdc 'git diff --cached'
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
        abbr -a gmao 'git remote add origin'
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

        if command_exists git-secret
            abbr -a gsc 'git secret'
            abbr -a gsca 'git secret add'
            abbr -a gscr 'git secret remove'
            abbr -a gsch 'git secret hide'
            abbr -a gscv 'git secret reveal'
            abbr -a gscl 'git secret list'
            abbr -a gsct 'git secret tell'
        end
    end

    # Python
    abbr -a pipi 'pip install -U'
    abbr -a pipr 'pip install -U -r'
    abbr -a pipe 'pip install -U -e .'
    abbr -a pipreq 'pip install -r requirements.txt -U'
    abbr -a pipdev 'pip install -r requirements-dev.txt -U'
    abbr -a pipu 'pip uninstall'
    abbr -a pips 'pip search'

    abbr -a pipi3 'pip3 install -U'
    abbr -a pipr3 'pip3 install -U -r'
    abbr -a pipe3 'pip3 install -U -e .'
    abbr -a pipreq3 'pip3 install -r requirements.txt -U'
    abbr -a pipdev3 'pip3 install -r requirements-dev.txt -U'
    abbr -a pipu3 'pip3 uninstall'
    abbr -a pips3 'pip3 search'

    if command_exists pytest
        abbr -a ptn 'pytest -s -p no:warnings'
        abbr -a ptb 'pytest -s -p no:warnings --pudb -k'
    end
    if command_exists rainbow
        abbr -a pytb 'rainbow -f pytb --'
    end
    if command_exists ipython
        abbr -a ipy 'ipython'
        abbr -a ipyml 'ipython --profile=ml'
        abbr -a ipysp 'ipython --profile=spfy'
        abbr -a ipyspa 'ipython --profile=spfy_async'
    end

    if command_exists hatch
        abbr -a hfix 'hatch grow fix; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (fix)"; and git push'
        abbr -a hmin 'hatch grow minor; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (minor)"; and git push'
        abbr -a hmaj 'hatch grow major; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (major)"; and git push'
        abbr -a hrel 'hatch build; and hatch release'
    end

    # Sublime
    if command_exists subl
        abbr -a ss 'subl'
        abbr -a fishc 'subl $HOME/.config/fish/config.fish'
    end
    if command_exists rsub
        abbr -a rs 'rsub'
        abbr -a srs 'sudo rsub -f'
    end

    # Kubernetes
    if command_exists kubectl
        abbr -a kc 'kubectl'
        abbr -a kcg 'kubectl get'
        abbr -a kcd 'kubectl describe'

        abbr -a kcgp 'kubectl get pods'
        abbr -a kcgd 'kubectl get deployments'
        abbr -a kcgr 'kubectl get replicasets'
        abbr -a kcgs 'kubectl get services'

        abbr -a kcdp 'kubectl describe pods'
        abbr -a kcdd 'kubectl describe deployments'
        abbr -a kcdr 'kubectl describe replicasets'
        abbr -a kcds 'kubectl describe services'

        abbr -a kcgpw 'kubectl get pod -o wide'
        abbr -a kcgdw 'kubectl get deployments -o wide'
        abbr -a kcgrw 'kubectl get replicasets -o wide'
    end

    # Kakoune
    if command_exists kak
        abbr -a k 'kak'
        abbr -a sk 'sudo kak'
    end

    # Docker
    if command_exists docker-compose
        abbr -a dcm 'docker-compose'

        abbr -a dcu 'docker-compose up'
        abbr -a dcud 'docker-compose up -d'

        abbr -a dcr 'docker-compose restart'
        abbr -a dcs 'docker-compose start'

        abbr -a dcrm 'docker-compose rm'
        abbr -a dcrms 'docker-compose rm -s'
        abbr -a dcrmf 'docker-compose rm -f'
        abbr -a dcrmsf 'docker-compose rm -s -f'

        abbr -a dcb 'docker-compose build'
        abbr -a dcd 'docker-compose down'
        abbr -a dcc 'docker-compose config'
        abbr -a dce 'docker-compose exec'
        abbr -a dcl 'docker-compose logs'
        abbr -a dclf 'docker-compose logs -f'
        abbr -a dcp 'docker-compose port'
        abbr -a dcps 'docker-compose ps'
        abbr -a dcrn 'docker-compose run'
        abbr -a dct 'docker-compose top'

        abbr -a dcpa 'docker-compose pause'
        abbr -a dcun 'docker-compose unpause'
        abbr -a dcev 'docker-compose events'
        alias dcrr='docker-compose rm -s -f $argv[1] && docker-compose up -d $argv[1] && echo Restarted'
    end

    if command_exists docker
        alias dkrr='docker service scale $argv[1]_$argv[2]=0 && docker service scale $argv[1]_$argv[2]=1 && echo Restarted'
        abbr -a dks 'docker service'
        abbr -a dkss 'docker service scale'
        abbr -a dksl 'docker service logs'
        abbr -a dkslf 'docker service logs -f'
        abbr -a dksp 'docker service ps --no-trunc'
        abbr -a dksls 'docker service ls'
        abbr -a dkk 'docker stack'
        abbr -a dkkd 'docker stack deploy'
        abbr -a dkkr 'docker stack rm'
        abbr -a dk 'docker'
        abbr -a dkc 'docker container'
        abbr -a dki 'docker image'
        abbr -a dkv 'docker volume'
        abbr -a dkn 'docker network'
        abbr -a dkps 'docker ps'
    end

    abbr -a tf 'tail -f -n 100'
    abbr -a f 'find . -iname '
    abbr -a own 'sudo chown (whoami)'
    abbr -a ownall 'sudo chown -R (whoami)'
    abbr -a reload 'source $HOME/.config/fish/config.fish'
    abbr -a wgetext 'wget -r -l1 -t1 -nd -N -np -erobots=off -A.pdf'
    abbr -a wh 'which'
    abbr -a wa 'watch -d --color'
    if command_exists mc
        abbr -a mcr 'sudo mc -u'
    end
    if command_exists youtube-dl
        abbr -a ydl 'youtube-dl'
    end
    if test -f /Applications/VLC.app/Contents/MacOS/VLC
        abbr -a vlc '/Applications/VLC.app/Contents/MacOS/VLC'
    end

    if command_exists kitty
        abbr -a icat 'kitty +kitten icat'
        abbr -a kdf 'kitty +kitten diff'
    end

    if command_exists lsd
        abbr -a l lsd
        abbr -a ll 'lsd -l'
        abbr -a la 'lsd -lA'
        abbr -a lt 'lsd -l --tree'
    end

    command_exists truncate
    or abbr -a truncate "gtruncate"
    abbr -a tac gtac

    command_exists sga-ssh
    and abbr -a mosh "mosh --ssh=sga-ssh"

    if command_exists zoxide
        abbr -a zi "z -i"
        abbr -a za "zoxide add"
        abbr -a zq "zoxide query"
        abbr -a zr "zoxide remove"
    end
    alias multitail='multitail -F $HOME/.config/multitail/multitail.conf'
end
