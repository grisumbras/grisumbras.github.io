#!/bin/sh


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


. ./activate.sh
b2
