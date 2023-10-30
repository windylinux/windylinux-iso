#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

if [[ -z "$EDITOR" ]]; then
  export EDITOR='vim'
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL='vim'
fi
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi

#
# File Manager
#

if [[ -z "$FILEMANAGER" ]]; then
  export FILEMANAGER='ranger'
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
  $HOME/.local/bin
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4'
fi

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(tty)" = "/dev/tty1" ] && [ "$(fgconsole 2>/dev/null || echo -1)" -eq 1 ]; then
  exec sway
fi

export XDG_DATA_DIRS="$HOME/.local/share:/usr/share:/usr/local/share"
export XDG_CONFIG_HOME="$HOME/.config"
# export THEME="light"
export PATH="$PATH:~/.cargo/bin"
# export FLUTTER_GIT_URL=ssh://git@github.com/flutter/flutter.git
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
