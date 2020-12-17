function abbra
    set -q _fish_abbr_$argv[1]; or abbr -a $argv[1] "$argv[2]"
end

function init_abbr
    if command_exists fzf
        abbra fzfr "echo '' | fzf --print-query --preview"
    end

    if command_exists open
        abbra o open
    else if command_exists xdg-open
        abbra o xdg-open
    end

    if command_exists tmuxinator
        abbra mux tmuxinator
    end

    if command_exists xcp
        abbra cp xcp
        abbra cpr 'xcp -r'
        abbra cpn 'xcp -n'
    end

    if command_exists procs
        abbra p 'sudo procs'
    end

    if command_exists et
        abbra ett 'et -x -f -r 52698:52698'
        abbra ex 'env LC_NO_FISH_INIT=1 et -x -f -r 52698:52698 -c "tmux a || tmux"'
    end
    if command_exists sshmux
        abbra sx 'sshmux'
        abbra sxc 'sshmux -CC'
    end

    abbra np 'nmap -T4 -v -Pn'
    abbra npa 'nmap -T4 -v -Pn -A'

    # Package manager
    if command_exists brew
        abbra i 'brew install'
        abbra ci 'brew cask install'
        abbra nf 'brew info'
        abbra s 'brew search'
        abbra cs 'brew search'
        abbra u 'brew uninstall'
        abbra bup 'brew update; and brew upgrade'
        abbra cnf 'brew cask info'
        abbra cu 'brew cask uninstall'
        abbra cup 'brew cu'
    end
    if command_exists apt-cyg
        abbra i 'apt-cyg install'
        abbra nf 'apt-cyg show'
        abbra s 'apt-cyg search'
        abbra u 'apt-cyg remove'
        abbra aup 'apt-cyg update'
    end

    if command_exists apt
        abbra ai 'sudo apt install -y'
        abbra as 'apt search'
        abbra au 'sudo apt remove'
        abbra aup 'sudo apt update; and sudo apt full-upgrade'
    end
    if command_exists yum
        abbra yi 'sudo yum install -y'
        abbra ys 'yum search'
        abbra yu 'sudo yum remove'
        abbra yup 'sudo yum update'
    end

    # OS Specific
    if is_darwin
        abbra kl 'sudo pkill -9 -f -l'
        abbra kstp 'sudo pkill -STOP -f -l'
        abbra kcnt 'sudo pkill -CONT -f -l'
    else
        abbra kl 'sudo pkill -9 -f -e'
        abbra kstp 'sudo pkill -STOP -f -e'
        abbra kcnt 'sudo pkill -CONT -f -e'
    end

    if not is_darwin
        and not test -d $HOME/.pyenv
        abbra pip 'sudo -H pip'
        abbra pip2 'sudo -H pip2'
    end

    if command_exists caffeinate
        abbra caff 'caffeinate -ism'
    end

    if command_exists brew
        abbra bsc 'brew services'
        abbra bscs 'brew services start'
        abbra bscr 'brew services restart'
        abbra bscp 'brew services stop'
    end
    if command_exists systemctl
        abbra suc 'systemctl --user'
        abbra sucs 'systemctl --user start'
        abbra suced 'systemctl --user edit'
        abbra sucen 'systemctl --user enable'
        abbra sucdd 'systemctl --user disable'
        abbra sucr 'systemctl --user restart'
        abbra succ 'systemctl --user cat'
        abbra sucp 'systemctl --user stop'
        abbra suct 'systemctl --user status'
        abbra sucd 'systemctl --user daemon-reload'
        abbra sucl 'journalctl -f -n 100 --user-unit'
        abbra suclc 'journalctl -f -n 100 --output cat --user-unit'

        abbra sc 'sudo systemctl'
        abbra scs 'sudo systemctl start'
        abbra sced 'sudo systemctl edit'
        abbra scen 'sudo systemctl enable'
        abbra scdd 'sudo systemctl disable'
        abbra scr 'sudo systemctl restart'
        abbra scc 'sudo systemctl cat'
        abbra scp 'sudo systemctl stop'
        abbra sct 'sudo systemctl status'
        abbra scd 'sudo systemctl daemon-reload'
        abbra scl 'sudo journalctl -f -n 100 -u'
        abbra sclc 'sudo journalctl -f -n 100 --output cat -u'
    end


    # Git
    if command_exists git-fuzzy
        abbra gfs 'git-fuzzy status'
        abbra gfh 'git-fuzzy stash'
        abbra gfb 'git-fuzzy branch'
        abbra gfl 'git-fuzzy log'
        abbra gfr 'git-fuzzy reflog'
        abbra gfd 'git-fuzzy diff'
        abbra gfp 'git-fuzzy pr'
    end

    if command_exists git
        abbra gb 'git branch'
        abbra gbr 'git branch -r'
        abbra gba 'git branch -a'
        abbra gbl 'git branch -l'
        abbra gbc 'git branch -c'
        abbra gbm 'git branch -m'
        abbra gbd 'git branch -d'
        abbra gbdd 'git branch -D'

        abbra gcp 'git cherry-pick'
        abbra gcpa 'git cherry-pick --abort'
        abbra gcpc 'git cherry-pick --continue'
        abbra gcpn 'git cherry-pick --no-commit'

        abbra gpl 'git pull'
        abbra gplr 'git pull --rebase'

        abbra gps 'git push'
        abbra gpf 'git push --force'
        abbra gpc 'git push --set-upstream origin (git symbolic-ref --short HEAD 2>/dev/null)'
        abbra gco 'git checkout'
        abbra gcb 'git checkout -b'
        abbra gcom 'git checkout master'
        abbra gcod 'git checkout develop'

        abbra ggc 'git rev-parse HEAD'
        abbra ggb 'git branch --show-current'

        abbra ga 'git add'
        abbra gaa 'git add .'

        abbra gdfc 'git difftool --cached'
        abbra gdc 'git diff --cached'
        abbra gdf 'git difftool'
        abbra gd 'git diff'

        abbra gl 'git log'

        abbra grs 'git reset'
        abbra grsh 'git reset --hard'
        abbra grsh1 'git reset --hard HEAD~1'
        abbra grsh2 'git reset --hard HEAD~2'
        abbra grsh3 'git reset --hard HEAD~3'

        abbra grr 'git rm'
        abbra grrf 'git rm --force'
        abbra grrc 'git rm --cached'

        abbra gm 'git remote'
        abbra gma 'git remote add'
        abbra gmao 'git remote add origin'
        abbra gmo 'git remote get-url origin'
        abbra gmso 'git remote set-url origin'

        abbra gf 'git fetch'
        abbra gfa 'git fetch --all'

        abbra gcl 'git clean'
        abbra gclf 'git clean -f'
        abbra gcld 'git clean -d'

        abbra gc 'git commit --verbose'
        abbra gcn 'git commit --no-verify --verbose'
        abbra gcm 'git commit --verbose --message'
        abbra gca 'git add .; git commit --verbose'
        abbra gcan 'git add .; git commit --no-verify --verbose'
        abbra gcam 'git add .; git commit --verbose --message'
        abbra gcaf 'git add .; git commit --verbose --message "Fixes and updates"'
        abbra gcamn 'git add .; git commit --verbose --message --no-verify'
        abbra gcafn 'git add .; git commit --verbose --message --no-verify "Fixes and updates"'
        abbra gcd 'git commit --amend --verbose'
        abbra gcad 'git add .; git commit --amend --verbose --no-edit'
        abbra gcadn 'git add .; git commit --amend --verbose --no-edit --no-verify'
        abbra gcdm 'git commit --amend --verbose --message'
        abbra gcadm 'git add .; git commit --amend --verbose --message'
        abbra gcadmn 'git add .; git commit --amend --verbose --message --no-verify'

        abbra gr 'git rebase'
        abbra gra 'git rebase --abort'
        abbra grc 'git rebase --continue'
        abbra grm 'git rebase master'
        abbra grd 'git rebase develop'
        abbra gitall 'ls -d */| xargs -P10 -I\{\} git -C \{\}'
        abbra gst 'git status'

        abbra gs 'git stash'
        abbra gsl 'git stash list'
        abbra gsp 'git stash pop'
        abbra gsa 'git stash apply'
        abbra gss 'git stash show'
        abbra gsd 'git stash drop'

        if command_exists git-secret
            abbra gsc 'git secret'
            abbra gsca 'git secret add'
            abbra gscr 'git secret remove'
            abbra gsch 'git secret hide'
            abbra gscv 'git secret reveal'
            abbra gscl 'git secret list'
            abbra gsct 'git secret tell'
        end
    end

    # Python
    abbra pipi 'pip install -U'
    abbra pipr 'pip install -U -r'
    abbra pipe 'pip install -U -e .'
    abbra pipreq 'pip install -r requirements.txt -U'
    abbra pipdev 'pip install -r requirements-dev.txt -U'
    abbra pipu 'pip uninstall'
    abbra pips 'pip search'

    abbra pipi3 'pip3 install -U'
    abbra pipr3 'pip3 install -U -r'
    abbra pipe3 'pip3 install -U -e .'
    abbra pipreq3 'pip3 install -r requirements.txt -U'
    abbra pipdev3 'pip3 install -r requirements-dev.txt -U'
    abbra pipu3 'pip3 uninstall'
    abbra pips3 'pip3 search'

    if command_exists pytest
        abbra ptn 'pytest -s -p no:warnings'
        abbra ptb 'pytest -s -p no:warnings --pudb -k'
    end
    if command_exists rainbow
        abbra pytb 'rainbow -f pytb --'
    end
    if command_exists ipython
        abbra ipy 'ipython'
        abbra ipyml 'ipython --profile=ml'
        abbra ipysp 'ipython --profile=spfy'
        abbra ipyspa 'ipython --profile=spfy_async'
    end

    if command_exists hatch
        abbra hfix 'hatch grow fix; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (fix)"; and git push'
        abbra hmin 'hatch grow minor; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (minor)"; and git push'
        abbra hmaj 'hatch grow major; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (major)"; and git push'
        abbra hrel 'hatch build; and hatch release'
    end

    # Sublime
    if command_exists subl
        abbra ss 'subl'
        abbra fishc 'subl $HOME/.config/fish/config.fish'
    end
    if command_exists rsub
        abbra rs 'rsub'
        abbra srs 'sudo rsub -f'
    end

    # Kubernetes
    if command_exists kubectl
        abbra ksn "kubectl config set-context (kubectl config current-context) --namespace"
        abbra ksc "kubectl config use-context"

        abbra kc 'kubectl'
        abbra kcg 'kubectl get'
        abbra kcd 'kubectl describe'

        abbra kce 'kubectl exec -it'
        function kcep
            set args $argv[2..-1]
            if not test "$args"
                set args bash
            end
            kubectl exec -it (kubectl get pods -o custom-columns=NAME:.metadata.name --sort-by=.status.startTime | grep -i $argv[1] | head -n 1) -- $args
        end

        function kclp
            kubectl logs -f (kubectl get pods -o custom-columns=NAME:.metadata.name --sort-by=.status.startTime | grep -i $argv[1] | head -n 1)
        end

        abbra kcgn 'kubectl get namespace'
        abbra kcgp 'kubectl get pods'
        abbra kcgd 'kubectl get deployments'
        abbra kcgr 'kubectl get replicasets'
        abbra kcgs 'kubectl get services'

        abbra kclf 'kubectl logs -f'

        abbra kcdp 'kubectl describe pods'
        abbra kcdd 'kubectl describe deployments'
        abbra kcdr 'kubectl describe replicasets'
        abbra kcds 'kubectl describe services'
        alias kcdpp='kubectl describe (kubectl get pods -o custom-columns=NAME:.metadata.name --sort-by=.status.startTime | grep -i $argv[1] | head -n 1)'

        abbra kcgpw 'kubectl get pod -o wide'
        abbra kcgdw 'kubectl get deployments -o wide'
        abbra kcgrw 'kubectl get replicasets -o wide'

        abbra kcprod 'kubectl config use-context prod.aws.uswest1.k8s.local && kubectl config set-context (kubectl config current-context) --namespace default'
        abbra kcstg 'kubectl config use-context eks_staging && kubectl config set-context (kubectl config current-context) --namespace staging'
        abbra kcdev 'kubectl config use-context eks_dev && kubectl config set-context (kubectl config current-context) --namespace develop'
    end

    # Kakoune
    if command_exists kak
        abbra k 'kak'
        abbra sk 'sudo kak'
    end

    # Docker
    if command_exists docker-compose
        abbra dcm 'docker-compose'

        abbra dcu 'docker-compose up'
        abbra dcud 'docker-compose up -d'

        abbra dcr 'docker-compose restart'
        abbra dcs 'docker-compose start'

        abbra dcrm 'docker-compose rm'
        abbra dcrms 'docker-compose rm -s'
        abbra dcrmf 'docker-compose rm -f'
        abbra dcrmsf 'docker-compose rm -s -f'

        abbra dcb 'docker-compose build'
        abbra dcd 'docker-compose down'
        abbra dcc 'docker-compose config'
        abbra dce 'docker-compose exec'
        abbra dcl 'docker-compose logs'
        abbra dclf 'docker-compose logs -f'
        abbra dcp 'docker-compose port'
        abbra dcps 'docker-compose ps'
        abbra dcrn 'docker-compose run'
        abbra dct 'docker-compose top'

        abbra dcpa 'docker-compose pause'
        abbra dcun 'docker-compose unpause'
        abbra dcev 'docker-compose events'
        alias dcrr='docker-compose rm -s -f $argv[1] && docker-compose up -d $argv[1] && echo Restarted'
    end

    if command_exists docker
        alias dkrr='docker service scale $argv[1]_$argv[2]=0 && docker service scale $argv[1]_$argv[2]=1 && echo Restarted'
        abbra dks 'docker service'
        abbra dkss 'docker service scale'
        abbra dksl 'docker service logs'
        abbra dkslf 'docker service logs -f'
        abbra dksp 'docker service ps --no-trunc'
        abbra dksls 'docker service ls'
        abbra dkk 'docker stack'
        abbra dkkd 'docker stack deploy'
        abbra dkkr 'docker stack rm'
        abbra dk 'docker'
        abbra dkc 'docker container'
        abbra dki 'docker image'
        abbra dkv 'docker volume'
        abbra dkn 'docker network'
        abbra dkps 'docker ps'
    end

    abbra tf 'tail -f -n 100'
    abbra f 'find . -iname '
    abbra own 'sudo chown (whoami)'
    abbra ownall 'sudo chown -R (whoami)'
    abbra reload 'source $HOME/.config/fish/config.fish'
    abbra wgetext 'wget -r -l1 -t1 -nd -N -np -erobots=off -A.pdf'
    abbra wh 'which'
    abbra wa 'watch -d --color'
    if command_exists mc
        abbra mcr 'sudo mc -u'
    end
    if command_exists youtube-dl
        abbra ydl 'youtube-dl'
    end
    if test -f /Applications/VLC.app/Contents/MacOS/VLC
        abbra vlc '/Applications/VLC.app/Contents/MacOS/VLC'
    end

    if command_exists kitty
        abbra icat 'kitty +kitten icat'
        abbra kdf 'kitty +kitten diff'
    end

    if command_exists lsd
        abbra l lsd
        abbra ll 'lsd -l'
        abbra la 'lsd -lA'
        abbra lt 'lsd -l --tree'
    end

    command_exists gtruncate
    and abbra truncate "gtruncate"
    abbra tac gtac

    alias multitail='multitail -F $HOME/.config/multitail/multitail.conf'

    abbra mkj "make -j(nproc)"

    command_exists zoxide
    and zoxide init fish 2>/dev/null | source
end
