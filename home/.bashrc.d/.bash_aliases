# Shortcuts
alias ll="ls -alF"
alias ..="cd .."
alias ...="cd ../.."
alias q="exit"

# Git
alias git-log="git log --graph --oneline --decorate --all"

# SSH port forwarding for ParaView server
alias ssh-port="echo 'ssh port forwarding running...'; ssh -f -N -L localhost:11111:cid:11111 cid"

# MPI process 'fix'
alias mpifix="sudo bash -c 'echo 0 > /proc/sys/kernel/yama/ptrace_scope'"

# Display personnal bash functions
alias functions='cat ~/.bashrc.d/.bash_functions | grep "#"'
