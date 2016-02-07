export PS1="\w $ "
export PATH="/usr/local/opt/ccache/libexec:$PATH"
export DBC_USERNAME=Nong

alias ls='ls -G'
alias gs='git status'
alias gb='git branch'
alias gl='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias ms='mvn package -DskipTests -Dhive -Dhadoop-2.6 -Dhadoop.version=2.6.0 -Phive-thriftserver'

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
