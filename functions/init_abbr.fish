function init_abbr
    if command_exists open
        set -q _fish_abbr_o; or abbr -a o open
    else if command_exists xdg-open
        set -q _fish_abbr_o; or abbr -a o xdg-open
    end

    if command_exists tmuxinator
        set -q _fish_abbr_mux; or abbr -a mux tmuxinator
    end

    if command_exists et
        set -q _fish_abbr_ett; or abbr -a ett 'et -x -f -r 52698:52698'
        set -q _fish_abbr_ex; or abbr -a ex 'env LC_NO_FISH_INIT=1 et -x -f -r 52698:52698 -c "tmux a || tmux"'
    end
    if command_exists sshmux
        set -q _fish_abbr_sx; or abbr -a sx 'sshmux'
        set -q _fish_abbr_sxc; or abbr -a sxc 'sshmux -CC'
    end

    set -q _fish_abbr_np; or abbr -a np 'nmap -T4 -v -Pn'
    set -q _fish_abbr_npa; or abbr -a npa 'nmap -T4 -v -Pn -A'

    # Package manager
    if command_exists brew
        set -q _fish_abbr_i; or abbr -a i 'brew install'
        set -q _fish_abbr_ci; or abbr -a ci 'brew cask install'
        set -q _fish_abbr_nf; or abbr -a nf 'brew info'
        set -q _fish_abbr_s; or abbr -a s 'brew search'
        set -q _fish_abbr_cs; or abbr -a cs 'brew search'
        set -q _fish_abbr_u; or abbr -a u 'brew uninstall'
        set -q _fish_abbr_bup; or abbr -a bup 'brew update; and brew upgrade'
        set -q _fish_abbr_cnf; or abbr -a cnf 'brew cask info'
        set -q _fish_abbr_cu; or abbr -a cu 'brew cask uninstall'
        set -q _fish_abbr_cup; or abbr -a cup 'brew cu'
    end
    if command_exists apt-cyg
        set -q _fish_abbr_i; or abbr -a i 'apt-cyg install'
        set -q _fish_abbr_nf; or abbr -a nf 'apt-cyg show'
        set -q _fish_abbr_s; or abbr -a s 'apt-cyg search'
        set -q _fish_abbr_u; or abbr -a u 'apt-cyg remove'
        set -q _fish_abbr_aup; or abbr -a aup 'apt-cyg update'
    end

    if command_exists apt
        set -q _fish_abbr_ai; or abbr -a ai 'sudo apt install -y'
        set -q _fish_abbr_as; or abbr -a as 'apt search'
        set -q _fish_abbr_au; or abbr -a au 'sudo apt remove'
        set -q _fish_abbr_aup; or abbr -a aup 'sudo apt update; and sudo apt full-upgrade'
    end
    if command_exists yum
        set -q _fish_abbr_yi; or abbr -a yi 'sudo yum install -y'
        set -q _fish_abbr_ys; or abbr -a ys 'yum search'
        set -q _fish_abbr_yu; or abbr -a yu 'sudo yum remove'
        set -q _fish_abbr_yup; or abbr -a yup 'sudo yum update'
    end

    # OS Specific
    if is_darwin
        set -q _fish_abbr_kl; or abbr -a kl 'sudo pkill -9 -f -l'
    else
        set -q _fish_abbr_kl; or abbr -a kl 'sudo pkill -9 -f -e'
    end

    if not is_darwin
        and not test -d $HOME/.pyenv
        set -q _fish_abbr_pip; or abbr -a pip 'sudo -H pip'
        set -q _fish_abbr_pip2; or abbr -a pip2 'sudo -H pip2'
    end

    if command_exists caffeinate
        set -q _fish_abbr_caff; or abbr -a caff 'caffeinate -ism'
    end

    if command_exists brew
        set -q _fish_abbr_bsc; or abbr -a bsc 'brew services'
        set -q _fish_abbr_bscs; or abbr -a bscs 'brew services start'
        set -q _fish_abbr_bscr; or abbr -a bscr 'brew services restart'
        set -q _fish_abbr_bscp; or abbr -a bscp 'brew services stop'
    end
    if command_exists systemctl
        set -q _fish_abbr_suc; or abbr -a suc 'systemctl --user'
        set -q _fish_abbr_sucs; or abbr -a sucs 'systemctl --user start'
        set -q _fish_abbr_suced; or abbr -a suced 'systemctl --user edit'
        set -q _fish_abbr_sucen; or abbr -a sucen 'systemctl --user enable'
        set -q _fish_abbr_sucdd; or abbr -a sucdd 'systemctl --user disable'
        set -q _fish_abbr_sucr; or abbr -a sucr 'systemctl --user restart'
        set -q _fish_abbr_succ; or abbr -a succ 'systemctl --user cat'
        set -q _fish_abbr_sucp; or abbr -a sucp 'systemctl --user stop'
        set -q _fish_abbr_suct; or abbr -a suct 'systemctl --user status'
        set -q _fish_abbr_sucd; or abbr -a sucd 'systemctl --user daemon-reload'
        set -q _fish_abbr_sucl; or abbr -a sucl 'journalctl -f -n 100 --user-unit'
        set -q _fish_abbr_suclc; or abbr -a suclc 'journalctl -f -n 100 --output cat --user-unit'

        set -q _fish_abbr_sc; or abbr -a sc 'sudo systemctl'
        set -q _fish_abbr_scs; or abbr -a scs 'sudo systemctl start'
        set -q _fish_abbr_sced; or abbr -a sced 'sudo systemctl edit'
        set -q _fish_abbr_scen; or abbr -a scen 'sudo systemctl enable'
        set -q _fish_abbr_scdd; or abbr -a scdd 'sudo systemctl disable'
        set -q _fish_abbr_scr; or abbr -a scr 'sudo systemctl restart'
        set -q _fish_abbr_scc; or abbr -a scc 'sudo systemctl cat'
        set -q _fish_abbr_scp; or abbr -a scp 'sudo systemctl stop'
        set -q _fish_abbr_sct; or abbr -a sct 'sudo systemctl status'
        set -q _fish_abbr_scd; or abbr -a scd 'sudo systemctl daemon-reload'
        set -q _fish_abbr_scl; or abbr -a scl 'sudo journalctl -f -n 100 -u'
        set -q _fish_abbr_sclc; or abbr -a sclc 'sudo journalctl -f -n 100 --output cat -u'
    end


    # Git
    if command_exists git
        set -q _fish_abbr_gb; or abbr -a gb 'git branch'
        set -q _fish_abbr_gbr; or abbr -a gbr 'git branch -r'
        set -q _fish_abbr_gba; or abbr -a gba 'git branch -a'
        set -q _fish_abbr_gbl; or abbr -a gbl 'git branch -l'
        set -q _fish_abbr_gbc; or abbr -a gbc 'git branch -c'
        set -q _fish_abbr_gbm; or abbr -a gbm 'git branch -m'
        set -q _fish_abbr_gbd; or abbr -a gbd 'git branch -d'
        set -q _fish_abbr_gbdd; or abbr -a gbdd 'git branch -D'

        set -q _fish_abbr_gcp; or abbr -a gcp 'git cherry-pick'
        set -q _fish_abbr_gcpa; or abbr -a gcpa 'git cherry-pick --abort'
        set -q _fish_abbr_gcpc; or abbr -a gcpc 'git cherry-pick --continue'
        set -q _fish_abbr_gcpn; or abbr -a gcpn 'git cherry-pick --no-commit'

        set -q _fish_abbr_gpl; or abbr -a gpl 'git pull'
        set -q _fish_abbr_gplr; or abbr -a gplr 'git pull --rebase'

        set -q _fish_abbr_gps; or abbr -a gps 'git push'
        set -q _fish_abbr_gpf; or abbr -a gpf 'git push --force'
        set -q _fish_abbr_gpc; or abbr -a gpc 'git push --set-upstream origin (git symbolic-ref --short HEAD 2>/dev/null)'
        set -q _fish_abbr_gco; or abbr -a gco 'git checkout'
        set -q _fish_abbr_gcb; or abbr -a gcb 'git checkout -b'
        set -q _fish_abbr_gcom; or abbr -a gcom 'git checkout master'
        set -q _fish_abbr_gcod; or abbr -a gcod 'git checkout develop'

        set -q _fish_abbr_ggc; or abbr -a ggc 'git rev-parse HEAD'
        set -q _fish_abbr_ggb; or abbr -a ggb 'git branch --show-current'

        set -q _fish_abbr_ga; or abbr -a ga 'git add'
        set -q _fish_abbr_gaa; or abbr -a gaa 'git add .'

        set -q _fish_abbr_gdfc; or abbr -a gdfc 'git difftool --cached'
        set -q _fish_abbr_gdc; or abbr -a gdc 'git diff --cached'
        set -q _fish_abbr_gdf; or abbr -a gdf 'git difftool'
        set -q _fish_abbr_gd; or abbr -a gd 'git diff'

        set -q _fish_abbr_gl; or abbr -a gl 'git log'

        set -q _fish_abbr_grs; or abbr -a grs 'git reset'
        set -q _fish_abbr_grsh; or abbr -a grsh 'git reset --hard'
        set -q _fish_abbr_grsh1; or abbr -a grsh1 'git reset --hard HEAD~1'
        set -q _fish_abbr_grsh2; or abbr -a grsh2 'git reset --hard HEAD~2'
        set -q _fish_abbr_grsh3; or abbr -a grsh3 'git reset --hard HEAD~3'

        set -q _fish_abbr_grr; or abbr -a grr 'git rm'
        set -q _fish_abbr_grrf; or abbr -a grrf 'git rm --force'
        set -q _fish_abbr_grrc; or abbr -a grrc 'git rm --cached'

        set -q _fish_abbr_gm; or abbr -a gm 'git remote'
        set -q _fish_abbr_gma; or abbr -a gma 'git remote add'
        set -q _fish_abbr_gmao; or abbr -a gmao 'git remote add origin'
        set -q _fish_abbr_gmo; or abbr -a gmo 'git remote get-url origin'
        set -q _fish_abbr_gmso; or abbr -a gmso 'git remote set-url origin'

        set -q _fish_abbr_gf; or abbr -a gf 'git fetch'
        set -q _fish_abbr_gfa; or abbr -a gfa 'git fetch --all'

        set -q _fish_abbr_gcl; or abbr -a gcl 'git clean'
        set -q _fish_abbr_gclf; or abbr -a gclf 'git clean -f'
        set -q _fish_abbr_gcld; or abbr -a gcld 'git clean -d'

        set -q _fish_abbr_gc; or abbr -a gc 'git commit --verbose'
        set -q _fish_abbr_gcn; or abbr -a gcn 'git commit --no-verify --verbose'
        set -q _fish_abbr_gcm; or abbr -a gcm 'git commit --verbose --message'
        set -q _fish_abbr_gca; or abbr -a gca 'git add .; git commit --verbose'
        set -q _fish_abbr_gcan; or abbr -a gcan 'git add .; git commit --no-verify --verbose'
        set -q _fish_abbr_gcam; or abbr -a gcam 'git add .; git commit --verbose --message'
        set -q _fish_abbr_gcamn; or abbr -a gcamn 'git add .; git commit --verbose --message --no-verify'
        set -q _fish_abbr_gcd; or abbr -a gcd 'git commit --amend --verbose'
        set -q _fish_abbr_gcad; or abbr -a gcad 'git add .; git commit --amend --verbose --no-edit'
        set -q _fish_abbr_gcadn; or abbr -a gcadn 'git add .; git commit --amend --verbose --no-edit --no-verify'
        set -q _fish_abbr_gcdm; or abbr -a gcdm 'git commit --amend --verbose --message'
        set -q _fish_abbr_gcadm; or abbr -a gcadm 'git add .; git commit --amend --verbose --message'
        set -q _fish_abbr_gcadmn; or abbr -a gcadmn 'git add .; git commit --amend --verbose --message --no-verify'

        set -q _fish_abbr_gr; or abbr -a gr 'git rebase'
        set -q _fish_abbr_gra; or abbr -a gra 'git rebase --abort'
        set -q _fish_abbr_grc; or abbr -a grc 'git rebase --continue'
        set -q _fish_abbr_grm; or abbr -a grm 'git rebase master'
        set -q _fish_abbr_grd; or abbr -a grd 'git rebase develop'
        set -q _fish_abbr_gitall; or abbr -a gitall 'ls -d */| xargs -P10 -I\{\} git -C \{\}'
        set -q _fish_abbr_gst; or abbr -a gst 'git status'

        set -q _fish_abbr_gs; or abbr -a gs 'git stash'
        set -q _fish_abbr_gsl; or abbr -a gsl 'git stash list'
        set -q _fish_abbr_gsp; or abbr -a gsp 'git stash pop'
        set -q _fish_abbr_gsa; or abbr -a gsa 'git stash apply'
        set -q _fish_abbr_gss; or abbr -a gss 'git stash show'
        set -q _fish_abbr_gsd; or abbr -a gsd 'git stash drop'

        if command_exists git-secret
            set -q _fish_abbr_gsc; or abbr -a gsc 'git secret'
            set -q _fish_abbr_gsca; or abbr -a gsca 'git secret add'
            set -q _fish_abbr_gscr; or abbr -a gscr 'git secret remove'
            set -q _fish_abbr_gsch; or abbr -a gsch 'git secret hide'
            set -q _fish_abbr_gscv; or abbr -a gscv 'git secret reveal'
            set -q _fish_abbr_gscl; or abbr -a gscl 'git secret list'
            set -q _fish_abbr_gsct; or abbr -a gsct 'git secret tell'
        end
    end

    # Python
    set -q _fish_abbr_pipi; or abbr -a pipi 'pip install -U'
    set -q _fish_abbr_pipr; or abbr -a pipr 'pip install -U -r'
    set -q _fish_abbr_pipe; or abbr -a pipe 'pip install -U -e .'
    set -q _fish_abbr_pipreq; or abbr -a pipreq 'pip install -r requirements.txt -U'
    set -q _fish_abbr_pipdev; or abbr -a pipdev 'pip install -r requirements-dev.txt -U'
    set -q _fish_abbr_pipu; or abbr -a pipu 'pip uninstall'
    set -q _fish_abbr_pips; or abbr -a pips 'pip search'

    set -q _fish_abbr_pipi3; or abbr -a pipi3 'pip3 install -U'
    set -q _fish_abbr_pipr3; or abbr -a pipr3 'pip3 install -U -r'
    set -q _fish_abbr_pipe3; or abbr -a pipe3 'pip3 install -U -e .'
    set -q _fish_abbr_pipreq3; or abbr -a pipreq3 'pip3 install -r requirements.txt -U'
    set -q _fish_abbr_pipdev3; or abbr -a pipdev3 'pip3 install -r requirements-dev.txt -U'
    set -q _fish_abbr_pipu3; or abbr -a pipu3 'pip3 uninstall'
    set -q _fish_abbr_pips3; or abbr -a pips3 'pip3 search'

    if command_exists pytest
        set -q _fish_abbr_ptn; or abbr -a ptn 'pytest -s -p no:warnings'
        set -q _fish_abbr_ptb; or abbr -a ptb 'pytest -s -p no:warnings --pudb -k'
    end
    if command_exists rainbow
        set -q _fish_abbr_pytb; or abbr -a pytb 'rainbow -f pytb --'
    end
    if command_exists ipython
        set -q _fish_abbr_ipy; or abbr -a ipy 'ipython'
        set -q _fish_abbr_ipyml; or abbr -a ipyml 'ipython --profile=ml'
        set -q _fish_abbr_ipysp; or abbr -a ipysp 'ipython --profile=spfy'
        set -q _fish_abbr_ipyspa; or abbr -a ipyspa 'ipython --profile=spfy_async'
    end

    if command_exists hatch
        set -q _fish_abbr_hfix; or abbr -a hfix 'hatch grow fix; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (fix)"; and git push'
        set -q _fish_abbr_hmin; or abbr -a hmin 'hatch grow minor; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (minor)"; and git push'
        set -q _fish_abbr_hmaj; or abbr -a hmaj 'hatch grow major; and hatch build; and hatch release; and git add .; and git commit --no-verify --message "Bump version (major)"; and git push'
        set -q _fish_abbr_hrel; or abbr -a hrel 'hatch build; and hatch release'
    end

    # Sublime
    if command_exists subl
        set -q _fish_abbr_ss; or abbr -a ss 'subl'
        set -q _fish_abbr_fishc; or abbr -a fishc 'subl $HOME/.config/fish/config.fish'
    end
    if command_exists rsub
        set -q _fish_abbr_rs; or abbr -a rs 'rsub'
        set -q _fish_abbr_srs; or abbr -a srs 'sudo rsub -f'
    end

    # Kubernetes
    if command_exists kubectl
        set -q _fish_abbr_kc; or abbr -a kc 'kubectl'
        set -q _fish_abbr_kcg; or abbr -a kcg 'kubectl get'
        set -q _fish_abbr_kcd; or abbr -a kcd 'kubectl describe'

        set -q _fish_abbr_kcgp; or abbr -a kcgp 'kubectl get pods'
        set -q _fish_abbr_kcgd; or abbr -a kcgd 'kubectl get deployments'
        set -q _fish_abbr_kcgr; or abbr -a kcgr 'kubectl get replicasets'
        set -q _fish_abbr_kcgs; or abbr -a kcgs 'kubectl get services'

        set -q _fish_abbr_kcdp; or abbr -a kcdp 'kubectl describe pods'
        set -q _fish_abbr_kcdd; or abbr -a kcdd 'kubectl describe deployments'
        set -q _fish_abbr_kcdr; or abbr -a kcdr 'kubectl describe replicasets'
        set -q _fish_abbr_kcds; or abbr -a kcds 'kubectl describe services'

        set -q _fish_abbr_kcgpw; or abbr -a kcgpw 'kubectl get pod -o wide'
        set -q _fish_abbr_kcgdw; or abbr -a kcgdw 'kubectl get deployments -o wide'
        set -q _fish_abbr_kcgrw; or abbr -a kcgrw 'kubectl get replicasets -o wide'
    end

    # Kakoune
    if command_exists kak
        set -q _fish_abbr_k; or abbr -a k 'kak'
        set -q _fish_abbr_sk; or abbr -a sk 'sudo kak'
    end

    # Docker
    if command_exists docker-compose
        set -q _fish_abbr_dcm; or abbr -a dcm 'docker-compose'

        set -q _fish_abbr_dcu; or abbr -a dcu 'docker-compose up'
        set -q _fish_abbr_dcud; or abbr -a dcud 'docker-compose up -d'

        set -q _fish_abbr_dcr; or abbr -a dcr 'docker-compose restart'
        set -q _fish_abbr_dcs; or abbr -a dcs 'docker-compose start'

        set -q _fish_abbr_dcrm; or abbr -a dcrm 'docker-compose rm'
        set -q _fish_abbr_dcrms; or abbr -a dcrms 'docker-compose rm -s'
        set -q _fish_abbr_dcrmf; or abbr -a dcrmf 'docker-compose rm -f'
        set -q _fish_abbr_dcrmsf; or abbr -a dcrmsf 'docker-compose rm -s -f'

        set -q _fish_abbr_dcb; or abbr -a dcb 'docker-compose build'
        set -q _fish_abbr_dcd; or abbr -a dcd 'docker-compose down'
        set -q _fish_abbr_dcc; or abbr -a dcc 'docker-compose config'
        set -q _fish_abbr_dce; or abbr -a dce 'docker-compose exec'
        set -q _fish_abbr_dcl; or abbr -a dcl 'docker-compose logs'
        set -q _fish_abbr_dclf; or abbr -a dclf 'docker-compose logs -f'
        set -q _fish_abbr_dcp; or abbr -a dcp 'docker-compose port'
        set -q _fish_abbr_dcps; or abbr -a dcps 'docker-compose ps'
        set -q _fish_abbr_dcrn; or abbr -a dcrn 'docker-compose run'
        set -q _fish_abbr_dct; or abbr -a dct 'docker-compose top'

        set -q _fish_abbr_dcpa; or abbr -a dcpa 'docker-compose pause'
        set -q _fish_abbr_dcun; or abbr -a dcun 'docker-compose unpause'
        set -q _fish_abbr_dcev; or abbr -a dcev 'docker-compose events'
        alias dcrr='docker-compose rm -s -f $argv[1] && docker-compose up -d $argv[1] && echo Restarted'
    end

    if command_exists docker
        alias dkrr='docker service scale $argv[1]_$argv[2]=0 && docker service scale $argv[1]_$argv[2]=1 && echo Restarted'
        set -q _fish_abbr_dks; or abbr -a dks 'docker service'
        set -q _fish_abbr_dkss; or abbr -a dkss 'docker service scale'
        set -q _fish_abbr_dksl; or abbr -a dksl 'docker service logs'
        set -q _fish_abbr_dkslf; or abbr -a dkslf 'docker service logs -f'
        set -q _fish_abbr_dksp; or abbr -a dksp 'docker service ps --no-trunc'
        set -q _fish_abbr_dksls; or abbr -a dksls 'docker service ls'
        set -q _fish_abbr_dkk; or abbr -a dkk 'docker stack'
        set -q _fish_abbr_dkkd; or abbr -a dkkd 'docker stack deploy'
        set -q _fish_abbr_dkkr; or abbr -a dkkr 'docker stack rm'
        set -q _fish_abbr_dk; or abbr -a dk 'docker'
        set -q _fish_abbr_dkc; or abbr -a dkc 'docker container'
        set -q _fish_abbr_dki; or abbr -a dki 'docker image'
        set -q _fish_abbr_dkv; or abbr -a dkv 'docker volume'
        set -q _fish_abbr_dkn; or abbr -a dkn 'docker network'
        set -q _fish_abbr_dkps; or abbr -a dkps 'docker ps'
    end

    set -q _fish_abbr_tf; or abbr -a tf 'tail -f -n 100'
    set -q _fish_abbr_f; or abbr -a f 'find . -iname '
    set -q _fish_abbr_own; or abbr -a own 'sudo chown (whoami)'
    set -q _fish_abbr_ownall; or abbr -a ownall 'sudo chown -R (whoami)'
    set -q _fish_abbr_reload; or abbr -a reload 'source $HOME/.config/fish/config.fish'
    set -q _fish_abbr_wgetext; or abbr -a wgetext 'wget -r -l1 -t1 -nd -N -np -erobots=off -A.pdf'
    set -q _fish_abbr_wh; or abbr -a wh 'which'
    set -q _fish_abbr_wa; or abbr -a wa 'watch -d --color'
    if command_exists mc
        alias mc='env SHELL=(which fish) TERM=xterm-256color VIEWER="bat --pager=always --pager=less" LESS="-r -R --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4" mc'
        set -q _fish_abbr_mcr; or abbr -a mcr 'sudo mc -u'
    end
    if command_exists youtube-dl
        set -q _fish_abbr_ydl; or abbr -a ydl 'youtube-dl'
    end
    if test -f /Applications/VLC.app/Contents/MacOS/VLC
        set -q _fish_abbr_vlc; or abbr -a vlc '/Applications/VLC.app/Contents/MacOS/VLC'
    end

    if command_exists kitty
        set -q _fish_abbr_icat; or abbr -a icat 'kitty +kitten icat'
        set -q _fish_abbr_kdf; or abbr -a kdf 'kitty +kitten diff'
    end

    if command_exists lsd
        set -q _fish_abbr_l; or abbr -a l lsd
        set -q _fish_abbr_ll; or abbr -a ll 'lsd -l'
        set -q _fish_abbr_la; or abbr -a la 'lsd -lA'
        set -q _fish_abbr_lt; or abbr -a lt 'lsd -l --tree'
    end

    command_exists truncate
    or set -q _fish_abbr_truncate; or abbr -a truncate "gtruncate"
    set -q _fish_abbr_tac; or abbr -a tac gtac

    command_exists sga-ssh
    and set -q _fish_abbr_mosh; or abbr -a mosh "mosh --ssh=sga-ssh"

    if command_exists zoxide
        set -q _fish_abbr_zi; or abbr -a zi "z -i"
        set -q _fish_abbr_za; or abbr -a za "zoxide add"
        set -q _fish_abbr_zq; or abbr -a zq "zoxide query"
        set -q _fish_abbr_zr; or abbr -a zr "zoxide remove"
    end
    alias multitail='multitail -F $HOME/.config/multitail/multitail.conf'
end
