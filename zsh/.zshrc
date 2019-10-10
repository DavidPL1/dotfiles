plugins=(
    zsh-completions
    zsh-syntax-highlighting
    zsh-autosuggestions
    )

export ZSH=~/.oh-my-zsh
export UPDATE_ZSH_DAYS=14
export LANG=en_US.UTF-8
export EDITOR=vim
export OS=`uname -s`
export TERM=xterm-256color

export $(dbus-launch)

ZSH_THEME="agnoster"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

eval `dircolors ~/.dir_colors/dircolors`

source $ZSH/oh-my-zsh.sh

# Disable History Sharing
unsetopt inc_append_history
unsetopt share_history

autoload -U compinit && compinit

function ls () {
    if [ $OS != Darwin ] && [ $OS != OpenBSD ]; then
        command $0 -N --color=auto "$@"
    else
        command $0 "$@"
    fi
}

alias dd="dd status=progress"
alias feh="feh -."
alias neofetch="neofetch --disable gpu uptime -su $HOME/img/Screenshots/ --scrot_cmd scrot"
alias pacman="sudo pacman"
alias qemu="qemu-system-x86_64 --enable-kvm"
alias tree="tree -C"
alias trizen="trizen --noconfirm"
alias watch="watch -c"
alias world="comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel xorg | sort)"

#Load vte for tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

#case $- in *i*)
#    [ -z "$TMUX" ] && exec tmux
#esac

source ~/.bash_aliases
export GIT_SSL_NO_VERIFY=true
export _JAVA_AWT_WM_NONREPARENTING=1
