all: autorandr bash foot git vim i3 lftp mutt picom pylint rofi waybar sway

.PHONY: autorandr
autorandr:
	rm -rf ~/.config/autorandr
	ln -s "${CURDIR}/autorandr" ~/.config/autorandr

.PHONY: alacritty
alacritty: 
	rm -rf ~/.config/alacritty
	ln -s "${CURDIR}/alacritty" ~/.config/alacritty

bash:
	for i in bash_profile bashrc; do \
		ln -sf "${CURDIR}/$$i" ~/."$$i"; \
	done

.PHONY: foot
foot:
	rm -rf ~/.config/foot
	ln -s "${CURDIR}/foot" ~/.config/foot

.PHONY: git
git:
	rm -rf ~/.config/git
	ln -s "${CURDIR}/git" ~/.config/git

.PHONY: vim
vim:
	rm -rf ~/.vim
	for i in gvimrc vimrc vim; do \
		ln -sf "${CURDIR}/$$i" ~/."$$i"; \
	done

.PHONY: i3
i3:
	for i in i3 i3status; do \
		rm -rf ~/.config/"$$i"; \
		ln -s "${CURDIR}/$$i" ~/.config/"$$i"; \
	done

.PHONY: lftp
lftp:
	rm -rf ~/.config/lftp
	ln -s "${CURDIR}/lftp" ~/.config/lftp

.PHONY: mutt
mutt:
	ln -s "${CURDIR}/mutt" ~/.config/mutt

picom:
	ln -sf "${CURDIR}/picom.conf" ~/.config/picom.conf

pylint:
	ln -sf "${CURDIR}/pylintrc" ~/.config/pylintrc

.PHONY: rofi
rofi:
	rm -rf ~/.config/rofi
	ln -s "${CURDIR}/rofi" ~/.config/rofi

.PHONY: waybar
waybar:
	rm -rf ~/.config/waybar
	ln -s "${CURDIR}/waybar" ~/.config/waybar

.PHONY: sway
sway:
	rm -rf ~/.config/sway
	ln -s "${CURDIR}/sway" ~/.config/sway

uninstall:
	find ~ -lname "${CURDIR}/*" -delete

