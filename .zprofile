alias zfe="cd ~/src/zvelo.io/frontend"
alias sojournerc="cd ~/src/sojournerc/"
alias economap="cd ~/src/economap"
alias vim="/usr/local/bin/vim"

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

export NODE_PATH="/usr/local/lib/node_modules:/usr/local/lib/node"
export NODE_ENV="development"

export PATH=$PATH:~/bin
export GOPATH=~/

#git aliases
alias gcl='git clone'
alias ga='git add'
alias gall='git add .'
alias g='git'
alias gs='git status'
alias gss='git status -s'
alias gl='git pull'
alias glo='git pull origin'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gpoh='git push origin head'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/mast'
alias gll='git log --graph --pretty=oneline --abbrev-commit'

alias git_branch_clean='git branch --merged >/tmp/merged-branches && vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches'


export NVM_DIR="/Users/chris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
