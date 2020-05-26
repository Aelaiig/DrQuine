#!/bin/bash

curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
source $HOME/.brewconfig.zsh
brew install nasm
brew install node14 # node --version $> 14.3.0