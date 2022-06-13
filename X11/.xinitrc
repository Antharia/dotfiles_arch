xrdb -merge $HOME/.config/X11/.Xresources
udiskie &

# setxkbmap -option caps:escape
setxkbmap fr

exec i3

wal -R
