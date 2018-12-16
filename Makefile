#
# Global Settings
#

PREFIX  ?= /home/david

# shell
XONSHRC = $(PREFIX)/.xonshrc

# text editor
NVIM_CONFIGDIR = $(PREFIX)/.config/nvim

VIMRC = $(PREFIX)/.vimrc
NVIMRC = $(NVIM_CONFIGDIR)/init.vim

# window manager
BSPWM_CONFIGDIR = $(PREFIX)/.config/bspwm
SXHKD_CONFIGDIR = $(PREFIX)/.config/sxhkd
POLYBAR_CONFIGDIR = $(PREFIX)/.config/polybar

BSPWM_CONFIG = $(BSPWM_CONFIGDIR)/bspwmrc
SXHKD_CONFIG = $(SXHKD_CONFIGDIR)/sxhkdrc
POLYBAR_CONFIG = $(POLYBAR_CONFIGDIR)/polybar


#
# Targets
#

all:
	@echo "Nothing to do"


install_texteditor:
	install -m0644 -D home/.config/nvim/init.vim $(NVIMRC)
	ln -sT $(NVIMRC) $(VIMRC)

install_wm:




uninstall:
	rm -f $(PATH_BSPWM_GNOME)
	rm -f $(PATH_BSPWM_GNOME_DESKTOP)
	rm -f $(PATH_BSPWM_GNOME_SESSION)
	rm -f $(PATH_BSPWM_GNOME_XSESSION)
	rm -f $(PATH_GNOME_SESSION_BSPWM)



.PHONY: all install uninstall
