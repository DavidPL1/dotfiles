current_dir := $(shell dirname $(realpath) $(lastword) $(MAKEFILE_LIST))
exclude_dirs := fonts/ colors/ suckless/
stow_dirs := $(filter-out $(exclude_dirs), $(wildcard */))

USERHOME := $(shell eval echo "~$$(logname)")

include makefiles/package_install.mk

bootstrap-install: essential-packages deploy-binaries setup-packagelist-watchdog dotfile-deploy check-matching-keys package-install 

deploy-binaries:
	$(info ##### DEPLOYING GENERAL CUSTOM SCRIPTS #####)
	@stow --target ${HOME} --dir ${current_dir} --restow bin

dotfile-deploy:
	$(info ##### UNSTOWING DOTFILES #####)

update:
	$(info ##### UPDATES NYI #####)

build-emacs:
	$(info ##### BUILDING EMACS... #####)
	@git clone git@github.com:emacs-mirror/emacs.git ${USERHOME}/git/emacs
	@cd ${USERHOME}/git/emacs; gith checkout emacs-27; ./autogen.sh; ./configure && make -j8 && sudo make install

update-emacs:
	$(info ##### UPDATING EMACS... #####)
	@cd ${USERHOME}/git/emacs; git checkout emacs-27; git pull --rebase; ./autogen.sh; ./configure && make -j8 && sudo make install

fetch-doom-config:
	$(info ##### FETCHING DOOM EMACS CONFIG... #####)
	#@git clone --depth 1 https://github.com/hlissner/doom-emacs ${USERHOME}/.emacs.d
	@rm -rf ${USERHOME}/.doom.d
	#@git clone git@github.com:DavidPL1/doom-config.git ${USERHOME}/.doom.d
	
	### Workaround for doom bug not updating package lists correctly:
	@cd ${USERHOME}/.emacs.d/.local/straight/repos/melpa && git pull
	@rm -f ${USERHOME}/.emacs.d/.local/straight/build-cache.el
	@${USERHOME}/.emacs.d/bin/doom sync

	@${USERHOME}/.emacs.d/bin/doom install --no-env
	@sudo ln -s ${USERHOME}/.emacs.d/bin/doom ${USERHOME}/bin/doom
	@doom sync

fetch-pass-db:
	$(info ##### FETCHING PASS-DB ... #####)

fetch-org-repo:
	$(info ##### FETCHING ORG-REPO ... #####)

check-matching-keys:
	@${current_dir}/util/match_key_pairs || (echo "[ERROR] Needed private keys were not found!"; exit 1)

.DEFAULT_GOAL := setup-packagelist-watchdog
