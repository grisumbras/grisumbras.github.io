#!/bin/sh


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


. ./activate.sh
ln -s project-config.sample.jam project-config.jam
b2
