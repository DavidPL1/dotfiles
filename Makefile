current_dir  := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
exclude_dirs := fonts/ colors/ suckless/
stow_dirs    := $(filter-out $(exclude_dirs), $(wildcard */))

init:
	mkdir -p $(HOME)/.vim_runtime/temp_dirs/undodir
	rm -rf $(HOME)/.oh-my-zsh

oh-my-zsh:
	wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
	sed -i.tmp "s/env zsh//g" install.sh
	sed -i.tmp "s/chsh -s .*$$//g" install.sh
	/bin/sh install.sh
	rm install.sh install.sh.tmp $(HOME)/.zshrc

suckless-tools-setup:
	echo "Creating install dirs for suckless tools"
	mkdir -p ${HOME}/suckless-tools/install/st
	mkdir -p ${HOME}/suckless-tools/install/slstatus
	mkdir -p ${HOME}/suckless-tools/install/dwm
	echo "Installing suckless-tools"
	cd ${HOME}/suckless-tools/src/st
	make install
	cd ${HOME}/suckless-tools/src/slstatus
	make install
	cd ${HOME}/suckless-tools/src/slstatus
	make install
	echo "Setting links to /usr/bin"
	sudo ln -s ${HOME}/suckless-tools/install/dwm/dwm /usr/bin/dwm
	sudo ln -s ${HOME}/suckless-tools/install/st/st /usr/bin/st
	sudo ln -s ${HOME}/suckless-tools/install/slstatus/slstatus /usr/bin/slstatus

dwm-switcher:
	sudo ln -s ${HOME}/scripts/switch_dwm.sh /usr/bin/switch_dwm

stow:
	stow --target $(HOME) --dir $(current_dir) --restow $(stow_dirs)

all: init oh-my-zsh suckless-tools-setup dwm-switcher stow

.DEFAULT_GOAL := stow
