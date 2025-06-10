
# start neovim in docker (start container by id# & execute interactive container by name)
alias dsuc='docker start 247 && docker exec -it my_ubuntu_container "/bin/bash"'
alias deuc='docker exec -it my_ubuntu_container "/bin/bash"'
# move to Dropbox
alias cptodb='cp -r .././ /mnt/c/Users/justk/Dropbox/repos'
# Terminal Customization
# - Powerline-Go Directory
alias powerline-go-themesws='cd ~/go/pkg/mod/github.com/justjanne/powerline-go'
alias pgtws='cd ~/go/pkg/mod/github.com/justjanne/powerline-go'
# entity framework
alias demr='dotnet ef migrations remove' 
# see version of ubuntu
alias version='lsb_release -a'
# sqlcmd commands
alias susa='sqlcmd -U sa -S localhost -C'
# psql commands
alias puk='psql -U kaycee -h localhost'
alias pup='psql -U postgres -h localhost'
# Docker Commands
alias dockercleanup='docker stop $1 && docker rm $1'
alias dsdr='docker stop $1 && docker rm $1'
# Kubectl Commands
alias kgpvc='kubectl get pvc'
alias kgpv='kubectl get pv'
alias kgd='kubectl get deployments'
alias kgp='kubectl get pods'
alias kg='kubectl get'
alias kdd='kubectl delete deployment'
alias kdpv='kubectl delete pv'
alias kdpvc='kubectl delete pvc'
alias kd='kubectl delete'
alias kaf='kubectl apply -f'
alias krrd='kubectl rollout restart deployment'

alias uu='sudo apt update && sudo apt upgrade -y'
alias lu='sudo apt list --upgradable'
alias ud='sudo apt update'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias ug='sudo apt upgrade'
alias clr='clear'
alias ar='sudo apt autoremove'
alias dropboxws='cd /mnt/c/Users/justk/Dropbox'
alias Dropboxws='cd /mnt/c/Users/justk/Dropbox'
alias reposws='cd ~/repos/'


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Colors for powerline-go
export POWERLINE_GO_COLORS="GitCleanBg=27,GitDirtyBg=27"
# Powerline prompt function
function _update_ps1() {
    local exit_code=$?      # Preserve the exit code of the last command
    local job_count=$(jobs -p | wc -l)

    PS1="$($HOME/go/bin/powerline-go \
        -error $exit_code \
        -jobs $job_count \
        -cwd-max-depth 3 \
        -hostname-only-if-ssh \
        -modules 'perms,cwd,hg,root' \
	-theme ~/.config/powerline-go/gruvbox-ai-gen1.json \
	-git-disable-stats ahead,behind,staged,notStaged,untracked,conflicted,stashed
    )"
}
  

# (This disables git, it go in the PS1 line) -git-disable-stats ahead,behind,staged,notStaged,untracked,conflicted,stashed \

# Hook it into your shell prompt system
PROMPT_COMMAND="_update_ps1"

# Open tmux by default, only when you open the dedicated terminal. Not VSCode's terminal (Not starting last session)
# if command -v tmux &> /dev/null && [ -n "$PS0" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   # Create a unique timestamp-based session name for VSCode
#   if [ -n "$VSCODE_PID" ] || [[ "$(ps -o comm= $PPID)" == *"code"* ]] || [ -n "$VSCODE_CWD" ] || [ -n "$VSCODE_IPC_HOOK" ]; then
#     # Create a unique session name based on terminal instance
#     SESSION_NAME="vscode-$$"
#     exec tmux new-session -A -s "$SESSION_NAME"
#  else
#     # For non-VSCode terminals, use previous behavior
#     if tmux ls &> /dev/null; then
#       LATEST_SESSION=$(tmux list-sessions -F "#{session_last_attached} #{session_name}" | sort -nr | head -n1 | cut -d' ' -f2)
#       exec tmux attach -t "$LATEST_SESSION"
#     else
#       exec tmux new-session
#     fi
#   fi
# fi

# List all colors available in powerline
#for i in {0..255}; do
#    printf "\x1b[38;5;${i}m${i}\x1b[0m "
#done
#echo
#source ~/trueline/trueline.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
