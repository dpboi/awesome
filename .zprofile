# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:="/tmp/runtime-boi"}

# Disable files
export LESSHISTFILE=-

# Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS="1;1;1"
export GDK_SCALE=1
export GDK_DPI_SCALE=1

# Fixing Paths
export PATH=~/.local/bin:$PATH
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export PATH=~/.emacs.d/bin:$PATH
CC="clang"
CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
LDLIBS="-lcrypt -lcs50 -lm"

# Default Apps
export EDITOR="emacsclient -c -a 'emacs'"
export READER="zathura"
export VISUAL="emacsclient -c -a 'emacs"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"
export VIDEO="mplayer"
export IMAGE="sxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export WM="awesome"

export CALIBRE_USE_SYSTEM_THEME=0
export CALIBRE_USE_DARK_PALETTE=1

if [[ "$(tty)" = "/dev/tty1" ]]; then
	      startx
fi
