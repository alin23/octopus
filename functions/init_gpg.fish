function init_gpg
    if not is_cygwin; and command_exists gpg-agent
        alias gpg_agent_running='pgrep gpg-agent >/dev/null'
        if [ -f $HOME/.gnupg/.gpg-agent-info ]; and gpg_agent_running
                source $HOME/.gnupg/.gpg-agent-info
                set -xg GPG_AGENT_INFO
        else if not gpg_agent_running
                eval (gpg-agent --daemon)
        end
    end
end
