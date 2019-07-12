#!/bin/sh


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


conan install . --build missing
. ./activate.sh
b2
