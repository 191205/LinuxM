# Fallback cursor
# xsetroot -cursor_name left_ptr

# Keyboard repeat rate
# xset r rate 200 60

xhost +SI:localuser:$USER

exec dbus-launch --exit-with-session emacs --eval '(require (quote exwmx-loader))'

