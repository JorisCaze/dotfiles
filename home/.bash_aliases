# Quick paths
alias cd-windows="cd /mnt/c/Users/Joris/"
alias cd-ecogen-env="cd ~/ecogen-env/"

# Tools
alias weather="curl wttr.in"

# Shortcuts
alias ll="ls -alF"
alias ..="cd .."
alias ...="cd ../.."
alias q="exit"
alias lds="du -h --max-depth=1 ." # (l)ist (d)isk (s)ize of current folder

# Git
alias git-log="git log --graph --oneline --decorate --all"

# SSH port forwarding for ParaView server
alias ssh-port="echo 'ssh port forwarding running...'; ssh -f -N -L localhost:11111:cid:11111 cid"

# MPI process 'fix'
alias mpifix="sudo bash -c 'echo 0 > /proc/sys/kernel/yama/ptrace_scope'"

# Display personnal bash functions
alias functions='cat /home/joris/.bash_functions | grep "#"'
