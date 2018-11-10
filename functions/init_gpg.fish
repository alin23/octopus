function init_gpg
    if not is_cygwin
        if is_darwin
            alias gpg_agent_running='pgrep -q gpg-agent'
        else
            alias gpg_agent_running='test (pgrep -c gpg-agent) -gt 0'
        end
        if [ -f $HOME/.gnupg/.gpg-agent-info ]; and gpg_agent_running
                source $HOME/.gnupg/.gpg-agent-info
                set -xU GPG_AGENT_INFO
        else if not gpg_agent_running
                eval (gpg-agent --daemon)
        end
    end
end
