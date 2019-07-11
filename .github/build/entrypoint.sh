#!/bin/sh


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


conan install .
./activate.sh
b2
