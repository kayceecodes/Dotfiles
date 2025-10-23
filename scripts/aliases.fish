# reload tmux
alias tmux-reload "tmux source-file ~/.tmux.conf && echo 'tmux config reloaded'"

# window manager control - move to workspaces
alias --save codews='code . & sleep 1 && wmctrl -r "code" -t 2'
# lazy docker
alias --save lydr="lazydocker"
alias --save lzydr="lazydocker"
# restart plank - rsplank
alias --save rsplank='killall plank > /dev/null 2>&1 && nohup plank > /dev/null 2>&1 &'
# start neovim in docker (start container by id# & execute interactive container by name)
alias --save dsuc='docker start 247 && docker exec -it my_ubuntu_container "/bin/bash"'
alias --save deuc='docker exec -it my_ubuntu_container "/bin/bash"'
# move to Dropbox
alias --save cptodb='cp -r .././ /mnt/c/Users/justk/Dropbox/repos'
# Terminal Customization
# - Powerline-Go Directory
alias --save powerline-go-themesws='cd ~/go/pkg/mod/github.com/justjanne/powerline-go'
alias --save pgtws='cd ~/go/pkg/mod/github.com/justjanne/powerline-go'
# entity framework
alias --save demr='dotnet ef migrations remove' 
# see version of ubuntu
alias --save version='lsb_release -a'
# sqlcmd commands
alias --save susa='sqlcmd -U sa -S localhost -C'
# psql commands
alias --save puk='psql -U kaycee -h localhost'
alias --save pup='psql -U postgres -h localhost'
# Docker Commands
alias --save dockercleanup='docker stop $1 && docker rm $1'
alias --save dsdr='docker stop $1 && docker rm $1'
# Kubectl Commands
alias --save kgpvc='kubectl get pvc'
alias --save kgpv='kubectl get pv'
alias --save kgd='kubectl get deployments'
alias --save kgp='kubectl get pods'
alias --save kg='kubectl get'
alias --save kdd='kubectl delete deployment'
alias --save kdpv='kubectl delete pv'
alias --save kdpvc='kubectl delete pvc'
alias --save kd='kubectl delete'
alias --save kaf='kubectl apply -f'
alias --save krrd='kubectl rollout restart deployment'
# Update, Upgrade, List Upgradable
alias --save uu='sudo apt update && sudo apt upgrade -y && flatpak update'
alias --save lu='sudo apt list --upgradable'
alias --save ud='sudo apt update && flatpak update'
alias --save upd='sudo apt update && flatpak update'
alias --save ug='sudo apt upgrade'
alias --save upg='sudo apt upgrade'

alias --save clr='clear'
alias --save ar='sudo apt autoremove'
alias --save dropboxws='cd /mnt/c/Users/justk/Dropbox'
alias --save Dropboxws='cd /mnt/c/Users/justk/Dropbox'
alias --save reposws='cd ~/repos/'
