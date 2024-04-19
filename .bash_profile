# Get aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Environment variables
if ! [[ "$PATH" =~ "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR="vim"
export DOCKER_HOST="unix:///run/user/${UID}/docker.sock"
