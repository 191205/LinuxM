#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

## Themes, etc
#gnome-settings-daemon &
#
## Fallback cursor
#xsetroot -cursor_name left_ptr
# Based on exwm guidliness
if [ -s /etc/.Xmodmap]; then
    xmodmap /etc/.Xmodmap
fi
# Disable access control
xhost +SI:localuser:$USER
# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1


# Keyboard repeat rate
xset r rate 200 50

# Start Emacs
exec dbus-launch --exit-with-session emacs
