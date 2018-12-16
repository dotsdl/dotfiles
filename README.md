# .son .files

This repo features the dotfiles I prefer in place for my development machine environment. It is by no means comprehensive, but includes probably 90% of what is needed for me to get running.

## Makefile

The Makefile is not yet complete. I'd like to get it in a state where it can put everything in its proper place, and also do the reverse.

Installing all software needed for these configs to mean anything is outside of the scope of this repo.

## Features

This repo features configs for the following so far.

- `xonsh`: shell
- `nvim`: text editor
- `bspwm`: window manager
- `sxhkd`: keyboard shortcut daemon
- `polybar`: status bar
- `autorandr`: automatic xrandr switching for external monitors


## Setup notes

I use `bspwm` started under a `gnome-session` instance, which spawns the daemons that typically are running when using Gnome Shell.
It has the added benefit of running everything under the `gdm` display manager.
You can create this setup using [bspwm-gnome](https://github.com/dotsdl/bspwm-gnome).
Big thanks to [shizonic](https://github.com/shizonic) for making this work!
