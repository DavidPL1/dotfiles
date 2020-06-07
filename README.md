# Dotfiles

## Currently supported
- Manjaro
- Coming soon: Ubuntu

## Install Process
To install the whole system simply run ```make bootstrap-install```.
This will do the following things in this order:
0. Check which OS it's running on (and abort if unsupported)
1. Install essential packages that are needed for the bootstrapping process
 - e.g. stow which is needed to perform step 2
2. deploy dotfiles to the home directory
3. check if private keys needed to clone private repos and more stuff are present (finger print check)
4. Build the latest emacs release
5. clone doom config from separate repo
6. clone password database into the user home
7. clone separate org file repository into the user home

All these steps can be invoked manually with the following commands:
1. ```make essential-packages```
2. ```make dotfile-deploy```
3. ```make check-matching-keys```
4. ```make build-emacs```
5. ```make fetch-doom-config```
6. ```make fetch-pass-db```
7. ```make fetch-org-repo```

## Additional Tools
### Automatically keeping installed packages clean
Basic idea: A list of installed packages is tracked in ```/etc/maintenance/PACKAGEMANAGER/list/extra_installed.txt```, where PACKAGEMANAGER depends on the OS (pacman for manjaro/arch; apt for debian/ubuntu). On each reboot a cron job will remove packages not included in this list, this prevents piling up packages on the system which were installed for testing only.

By running ```check-installed-packages``` the amount of currently unsaved packages can be displayed. Additionally the options to look at these packages (by opening less) and save them to the list is given, if there is at least one unsaved package. Running the command with the `-f` flag will skip the prompts and add any unsaved packages to the list. 

Uninstalling unsaved packages can also be run manually with the command ```restore_packages```, this will also ensure all packages in the tracked list are installed on the system. 

The list will automatically be initialized when running the bootstrap install.
