#!/bin/sh


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan
conan install .
./activate.sh
b2
