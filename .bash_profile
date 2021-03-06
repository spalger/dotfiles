#!/usr/bin/env bash
# shellcheck disable=SC1090

__spalger_dotfiles__() {
  unset __spalger_dotfiles__

  main() {
    setup_aliases
    setup_bash_completion
    setup_env
    setup_java
    setup_node
    setup_go
    setup_rust
    setup_ruby
    setup_ps1
    setup_gcloud
  }

  setup_gcloud() {
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
  }

  setup_aliases() {
    if [ -f ~/.aliases ]; then
      source ~/.aliases
    else
      echo "NO .aliases"
    fi

    alias gut=git;
    alias gti=git;
    alias got=git;
    alias "atom-"='tmpin atom';
    alias ll='ls -1AhH';
    alias dock='eval "$(docker-machine env)"';
  }

  setup_bash_completion() {
    . "/usr/local/etc/profile.d/bash_completion.sh"
  }

  setup_env() {
    export EDITOR=vim

    export PATH="$HOME/bin:$PATH"
    export PATH="$HOME/.dotfiles/bin:$PATH"

    if [ -f "$HOME/.include.env" ]; then
      source "$HOME/.include.env"
    fi
  }

  setup_java() {
    source "$HOME/.jabba/jabba.sh"
  }

  setup_go() {
    export GOPATH="$HOME/gopath"
  }

  setup_rust() {
    source $HOME/.cargo/env
  }

  setup_ruby() {
    eval "$(rbenv init -)"
  }

  setup_node() {
    # setup node version manager
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh" # This loads nvm
    source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  }

  setup_ps1() {
    export GITAWAREPROMPT="$HOME/.dotfiles/repos/git-aware-prompt"
    source "$GITAWAREPROMPT/main.sh"
    # shellcheck disable=SC2154
    export PS1="\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] \$ "
  }

  main
}

__spalger_dotfiles__