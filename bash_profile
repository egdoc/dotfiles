#
# .bash_profile
#
# Author: Egidio Docile
#

# Get aliases and functions
[ -f ~/.bashrc ] && . ~/.bashrc


if command -v vimx &> /dev/null; then
  export EDITOR="vimx"
elif command -v vim &> /dev/null; then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi

# Add directories to PATH
pathmunge ~/.local/bin before
