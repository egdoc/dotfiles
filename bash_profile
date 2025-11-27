#
# .bash_profile
#
# Author: Egidio Docile
#

# Get aliases and functions
[ -f ~/.bashrc ] && . ~/.bashrc


pathmunge() {
  local -r dir="$1"
  local -r pos="$2"

  [[ -h "${dir}" ]] && return

  case ":${PATH}:" in
    *:"${dir}":*)
      ;;
    *)
      if [[ "${pos}" == "after" ]] ; then
        PATH=$PATH:"${dir}"
      else
        PATH="${dir}":$PATH
      fi
      ;;
  esac
}


# Environment variables
export DOCKER_HOST="unix:///$XDG_RUNTIME_DIR/podman/podman.sock"

if command -v vimx &> /dev/null; then
  export EDITOR="vimx"
else
  export EDITOR="vim"
fi


# Add directories to PATH
pathmunge ~/.local/bin before

unset -f pathmunge
