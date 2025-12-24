alias cls="clear"
alias ls="ls -A --color=auto"
alias tree="tree -a -I '.git'"

alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gf='git fetch'
alias gpl='git pull'

starship init fish | source

set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH
set -gx PATH $ANDROID_HOME/build-tools/34.0.0 $PATH

function fish_greeting
  fastfetch
end