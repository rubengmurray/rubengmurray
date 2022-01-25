
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

# NPM
alias npmi="npm i"
alias npml="npm link"
alias npmrs="npm run start"
alias npmrsd="npm run start:dev"
alias npmt="npm test"
alias npmr="npm run"

# REDIS
alias rs="redis-server"
alias rcli="redis-cli"

# GIT
alias gplh="git pull origin head"
alias ga.="git add ."
alias gcam="git commit -am"
alias gpl="git pull origin"
alias gps="git push origin head"
alias gbd="git branch -D"
alias gbdr="git push -d origin"

# DOCKER
alias dr="docker run"
alias dps="docker ps"
alias dcup="docker-compose up"
alias dcupb="docker-compose up --build"

# KUBE
alias kgp="kubectl get pods -n"
alias kl="kubectl logs -f -n"
alias kcu="kubectl config use-context"
alias kgc="kubectl get configmap -n"
alias kgd="kubectl get deployment -n"
alias kgsn="kubectl get secret -n"
alias kdp="kubectl describe pod -n"

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
