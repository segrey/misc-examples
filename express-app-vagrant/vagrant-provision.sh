#!/bin/bash

set -x
set -e

#sudo apt-get -qq update
#sudo apt-get -qq install git

export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`

  cat <<EOT >> "$HOME/.bashrc"
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOT

  set +x
  \. "$NVM_DIR/nvm.sh"
  nvm install 18
  set -x
fi
