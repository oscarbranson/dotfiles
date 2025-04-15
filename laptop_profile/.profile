#!/bin/bash

# path for wayland-modified apps
export PATH="$HOME/.local/bin:$PATH"

# rbenv setup
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

# python env shortcut
alias py3="source /home/oscar/.venvs/py3/bin/activate"
