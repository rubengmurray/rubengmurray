
# Path to your oh-my-zsh installation.
export ZSH="/Users/rubengmurray/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# GENERAL JS
alias nm.="nodemon ."

# STANDARD NPM
alias npmi="npm i"
alias ni="npm i"
alias npml="npm link"
alias nl="npm link"
alias npmrs="npm run start"
alias nrs="npm run start"
alias npmt="npm test"
alias nt="npm test"

# CUSTOM NPM
alias nti="npm run test:integration"
alias npmrsd="npm run start:dev"
alias nrsd="npm run start:dev"
alias ndt="npm run docker:teardown"

# REDIS
alias r-s="redis-server"
alias r-cli="redis-cli"

# GIT
alias gplh="git pull origin head"
alias ga.="git add ."
alias gcam="git commit -am"
alias gpl="git pull origin"
alias gps="git push origin head"
alias glm="git pull origin master"
alias gbd="git branch -D"

# Clean up local branches already merged master
alias gbmmaster="git branch --merged master | egrep -v '(^\*|master|dev)'"
alias gbmasterdel="git branch --merged master | egrep -v '(^\*|master|dev)' | xargs git branch -d"

# Clean up local branches already merged master
alias gbmmain="git branch --merged main | egrep -v '(^\*|main|dev)'"
alias gbmaindel="git branch --merged main | egrep -v '(^\*|main|dev)' | xargs git branch -d"

# DOCKER
alias dr="docker run"
alias dps="docker ps"
alias dcup="docker-compose up"
alias dcupb="docker-compose up --build"
alias dsi="docker system info"

# KUBE
alias kgp="kubectl get pods -n"
alias kgl="kubectl logs -f -n"
alias kcu="kubectl config use-context"
alias kgc="kubectl get configmap -n"
alias kgd="kubectl get deployment -n"
alias kgs="kubectl get secret -n"
alias kdp="kubectl describe pod -n"
alias kdelp="kubectl delete pod -n"

# For when a service doesn't start CreateContainerConfigError
alias kdps="kubectl describe pods -n"

# OTHER
alias calc="bc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

eval "$(fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell zsh)"
