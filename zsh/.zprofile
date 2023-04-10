# important paths
path+=('/home/boi/.local/bin')
export PATH=~/.local/bin:$PATH
export PATH=~/.cargo/env:$PATH
# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export HISTFILE="$XDG_DATA_HOME/history"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"

# Fixing Paths
export QT_QPA_PLATFORMTHEME="qt5ct"
export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm

# Default Apps
export TERMINAL="st"
export TERMINAL_PROG="st"
export ALTERNATE_EDITOR=""
export EDITOR="emacs"  # $EDITOR opens in terminal
export VISUAL="emacs"  # $VISUAL opens in GUI mode
export READER="zathura"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="imv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export WM="awesome"

export CALIBRE_USE_SYSTEM_THEME=0
export CALIBRE_USE_DARK_PALETTE=1

[ -f ~/.config/lf/LF_ICONS ] && {
	LF_ICONS="$(tr '\n' ':' <~/.config/lf/LF_ICONS)" \
		&& export LF_ICONS
}

# if login in tty1 (basically the first tty to open) then
if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep awesome || sx
fi
