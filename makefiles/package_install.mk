DISTRI := $(shell cat /etc/lsb-release | grep -o DISTRIB_ID.* | awk -F= '{print $$2}')
current_dir := $(shell pwd)

ifeq ($(DISTRI), ManjaroLinux)
package-install: pacman-packages
	$(info ### pacman install directive finished ###)

essential-packages: pacman-essential
	$(info ### pacman essental packages directive finished ###)

setup-packagelist-watchdog:
	@${current_dir}/util/pacman/set_package_cron_watchdog
	$(info ##### CRONJOB FOR PACMAN CLEANUP DEPLOYED #####)

else ifeq ($(DISTRI), Ubuntu)
package-install: apt-packages
	$(info ### apt install directive finished ###)

essential-packages: apt-essential
	$(info ### apt essential directive finished ###)

setup-packagelist-watchdog:
	$(warning APT PACKAGELIST WATCHDOG NYI)
	#@${current_dir}/util/apt/set_package_cron_watchdog
	#$(info ##### CRONJOB FOR APT CLEANUP DEPLOYED #####)
endif

apt-packages:
	$(error apt install directive currently not available)

pacman-packages:
	$(info ### Detected Arch/Manjaro. Running pacman install directive ###)

apt-essential:
	$(info ### Detected Debian/Ubuntu. Running essential apt install directive ###) 
	$(warning Ubuntu essentails not available yet)

pacman-essential:
	$(info ### Detected Arch/Manjaro. Running essential pacman install directive ###)
	$(warning ### Testing how errors look like ###)
	@pacman -S --needed --noconfirm vim pacaur stow
