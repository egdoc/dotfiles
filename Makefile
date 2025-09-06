all: alacritty \
	autorandr \
	bash \
	foot \
	git \
	vim \
	i3 \
	lftp \
	mutt \
	npm \
	picom \
	pylint \
	rofi \
	waybar \
	sway \
	tmux

.PHONY: alacritty
alacritty:
	rm -rf ~/.config/alacritty
	ln -s "${CURDIR}/alacritty" ~/.config/alacritty

.PHONY: autorandr
autorandr:
	rm -rf ~/.config/autorandr
	ln -s "${CURDIR}/autorandr" ~/.config/autorandr

bash:
	for i in bash_profile bashrc; do \
		ln -sf "${CURDIR}/$$i" ~/."$$i"; \
	done

.PHONY: foot
foot:
	rm -rf ~/.config/foot
	ln -s "${CURDIR}/foot" ~/.config/foot

git:
	rm -rf ~/.gitconfig
	ln -s "${CURDIR}/gitconfig" ~/.gitconfig

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

lftp:
	ln -sf "${CURDIR}/lftprc" ~/.lftprc

.PHONY: mutt
mutt:
	rm -rf ~/.config/mutt
	ln -s "${CURDIR}/mutt" ~/.config/mutt

npm:
	ln -sf "${CURDIR}/npmrc" ~/.npmrc

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

tmux:
	ln -sf "${CURDIR}/tmux.conf" ~/.tmux.conf

uninstall:
	find ~ -lname "${CURDIR}/*" -delete
