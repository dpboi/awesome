# .zshrc

export LD_LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib

# prompts
autoload -U promptinit; promptinit

# For a better Prompt
precmd() { print "" }
PS1='%B%k %4~ / %k%b%f '
PS2='%K{167} %K{235} -> %k '
#RPROMPT='%K{234} %K{235} %F{230}%D{%H:%M} %K{167} %k'

# history
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

zstyle :compinstall filename '/home/boi/.config/.zshrc'

# completion
autoload -Uz compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
compinit

# keys
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

################################################################################################
# Real stuff
# sudo not required for some system commands
for command in mount umount poweroff reboot sh connmanctl ; do
alias $command="sudo $command"
done; unset command

### ALIASES ###

# cd
alias \
  ..="cd .." \
  .2="cd ../.." \
  .3="cd ../../.." \

# bat as cat
[ -x "$(command -v bat)" ] && alias cat="bat"

# void
alias \
  xb-up="sudo vpm update -Su && xcheckrestart" \
  xb-get="sudo vpm install" \
  xb-rmv="sudo vpm remove -R" \
  xb-rmv-sec="sudo vpm remove" \
  xb-qry="sudo vpm search" \
  xb-cln="sudo vpm cleanup -o"

# power management
alias \
  po="loginctl poweroff" \
  sp="loginctl suspend" \
  rb="loginctl reboot" \

# youtube
alias \
  yta-aac="yt-dlp --extract-audio --audio-format aac" \
  yta-best="yt-dlp --extract-audio --audio-format best" \
  yta-flac="yt-dlp --extract-audio --audio-format flac" \
  yta-m4a="yt-dlp --extract-audio --audio-format m4a" \
  yta-mp3="yt-dlp --extract-audio --audio-format mp3" \
  yta-opus="yt-dlp --extract-audio --audio-format opus" \

# network and bluetooth
alias \
  netstats="nmcli dev" \
  wfi="nmtui-connect" \
  wfi-scan="nmcli dev wifi rescan && nmcli dev wifi list" \
  wfi-edit="nmtui-edit" \
  wfi-on="nmcli radio wifi on" \
  wfi-off="nmcli radio wifi off" \
  blt="bluetoothctl"

# emacs
alias em="emacsclient -c -a 'emacs' "

# lf
alias lf="lfrun"

### PLUGINS ###
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
