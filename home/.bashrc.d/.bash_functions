# SSH keys: run-ssh-agent
run-ssh-agent()
{
        read -p "Would you like to set ssh-agent? (y/n) " -n 1 -r yn
        echo
        if [ "$yn" = "y" ]; then
                eval `ssh-agent`
                ssh-add /home/joris/.ssh/keyJoris
                ssh-add /home/joris/.ssh/key_joris
        fi
}
