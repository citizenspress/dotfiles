
# PineBookPro Setup

The following files are modifications for the PineBook Pro running Manjaro i3

They include:

- .i3/config
- i3status.conf


## post install

sudo pacman -S mosh emacs sakura zathura mupdf

## ssh-agent

Add this to .bashrc

```
## ssh-agent command 

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

```

## run at startup

If you want xfce power management and network manager icons

- turn off power button actions on xfce power manager
- turn on suspend

xfce4-power-manager
nm-applet
