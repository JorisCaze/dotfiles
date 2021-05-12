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

# Get size of a file/folder: get-size
get-size()
{
	du -h $1 | tail -n 1
}

# Display last lines of a file
cail()
{
	cat $1 | tail -n 20
}
