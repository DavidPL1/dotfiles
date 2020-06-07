current_dir := $(shell dirname $(realpath) $(lastword) $(MAKEFILE_LIST))
exclude_dirs := fonts/ colors/ suckless/
stow_dirs := $(filter-out $(exclude_dirs), $(wildcard */))

USERHOME := $(shell eval echo "~$$(logname)")

include makefiles/package_install.mk

bootstrap-install: essential-packages deploy-binaries setup-packagelist-watchdog dotfile-deploy check-matching-keys package-install 

deploy-binaries:
	$(info ##### DEPLOYING GENERAL CUSTOM SCRIPTS #####)
	@stow --target ${HOME} --dir ${current_dir} --restow bin
	@echo "$$(logname) ALL=(root) NOPASSWD: ${USERHOME}/bin/restore_packages" | sudo EDITOR='tee -a' visudo
	@echo "$$(logname) ALL=(root) NOPASSWD: ${USERHOME}/bin/check_unsaved_packages" | sudo EDITOR='tee -a' visudo

dotfile-deploy:
	$(info ##### UNSTOWING DOTFILES #####)

update:
	$(info ##### UPDATES NYI #####)

build-emacs:
	$(info ##### BUILDING EMACS... #####)

fetch-doom-config:
	$(info ##### FETCHING DOOM EMACS CONFIG... #####)

fetch-pass-db:
	$(info ##### FETCHING PASS-DB ... #####)

fetch-org-repo:
	$(info ##### FETCHING ORG-REPO ... #####)

check-matching-keys:
	@${current_dir}/util/match_key_pairs || (echo "[ERROR] Needed private keys were not found!"; exit 1)

.DEFAULT_GOAL := setup-packagelist-watchdog
