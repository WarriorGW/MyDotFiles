alias cls="clear"
# alias ls="ls -A --color=always --group-directories-first"
alias tree="tree -a -I '.git'"

alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gf='git fetch'
alias gpl='git pull'

alias ls='eza -a --color=always --group-directories-first --icons --git-ignore'
alias lt='eza -aT --color=always --group-directories-first --icons --git-ignore'

alias cmdhist='history | awk '\''{print $1}'\'' | sort | uniq -c | sort -rn | head -10'
alias rankcmdhist='history | awk '\''{CMD[$1]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}'\'' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'
alias zhist='zoxide query -l -s'

starship init fish | source
zoxide init --cmd cd fish | source
fzf --fish | source

set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH
set -gx PATH $ANDROID_HOME/build-tools/34.0.0 $PATH

function fish_greeting
  fastfetch
end