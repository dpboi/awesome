-- Apps
local apps = {
  terminal = "alacritty",
  editor = "emacsclient -c -a 'emacs'",
  music = "alacritty -t ncmpcpp --class ncmpcpp,ncmpcpp -e ncmpcpp",
  file = "alacritty -t lf --class lf,lf -e lf",
  browser = "qutebrowser",
}
return apps
