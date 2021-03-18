PIP = $(shell command -v pip3 2> /dev/null || echo pip)
VIM_PLUGINS = https://github.com/ekalinin/Dockerfile.vim \
	https://github.com/evidens/vim-twig \
	https://github.com/Xuyuanp/nerdtree-git-plugin \
	https://github.com/scrooloose/nerdtree \
	https://github.com/tpope/vim-surround \
	https://github.com/ayu-theme/ayu-vim \
	https://github.com/neoclide/coc.nvim \
	https://github.com/vim-airline/vim-airline \
	https://github.com/vim-airline/vim-airline-themes

# ln -sfn does automatically replace existing directories symlinks, but not
# 'real' directories, therefore to be sure everything goes as expected we must
# delete them first.
define symlink_dir
  rm -rf $(2) && ln -s $(1) $(2)
endef

.PHONY: vim
vim:
	$(call symlink_dir,$(CURDIR)/vim/vim,~/.vim)
	ln -sf $(CURDIR)/vim/vim/baseconfig.vim ~/.vimrc
	ln -sf $(CURDIR)/xorg/Xmodmap ~/.Xmodmap

.PHONY: vim-workstation
vim-workstation: vim
	rm -rf ~/.vim/bundle \
	  && mkdir -p ~/.vim/autoload ~/.vim/bundle \
	  && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	@for repo in $(VIM_PLUGINS); do \
	  git -C ~/.vim/bundle clone --depth=1 $$repo; \
	done

	ln -sf $(CURDIR)/vim/vim/extended.vim ~/.vimrc

.PHONY: mutt
mutt:
	ln -sfn $(CURDIR)/mutt/muttrc ~/.muttrc
	$(call symlink_dir,$(CURDIR)/mutt/mutt,~/.mutt)

.PHONY: tmux
tmux:
	ln -sf $(CURDIR)/tmux/tmux.conf ~/.tmux.conf

.PHONY: i3
i3:
	$(call symlink_dir,$(CURDIR)/i3/i3,~/.config/i3)

.PHONY: i3status
i3status:
	$(call symlink_dir,$(CURDIR)/i3status,~/.config/i3status)

.PHONY: compton
compton:
	ln -sf $(CURDIR)/compton/compton.conf ~/.config/compton.conf

.PHONY: shell
shell:
	ln -sf $(CURDIR)/shell/profile ~/.profile

.PHONY: readline
readline:
	ln -sf $(CURDIR)/readline/inputrc ~/.inputrc

.PHONY: bash
bash: shell
	ln -sf $(CURDIR)/bash/bash_profile ~/.bash_profile
	ln -sf $(CURDIR)/bash/bashrc ~/.bashrc
	ln -sf $(CURDIR)/bash/bash_aliases ~/.bash_aliases

.PHONY: dunst
dunst:
	$(call symlink_dir,$(CURDIR)/dunst,~/.config/dunst)

.PHONY: nitrogen
nitrogen:
	$(call symlink_dir,$(CURDIR)/nitrogen,~/.config/nitrogen)

.PHONY: npm-setup
npm-setup:
	ln -sf $(CURDIR)/npm/npmrc ~/.npmrc

.PHONY: python-setup
python-setup:
	ln -sf $(CURDIR)/python/pylintrc ~/.pylintrc
	$(PIP) install -r $(CURDIR)/python/packages.txt --user

.PHONY: sakura
sakura:
	$(call symlink_dir,$(CURDIR)/sakura,~/.config/sakura)

.PHONY: smplayer
smplayer:
	$(call symlink_dir,$(CURDIR)/smplayer,~/.config/smplayer)

.PHONY: picard
picard:
	$(call symlink_dir,$(CURDIR)/picard/MusicBrainz,~/.config/MusicBrainz)

.PHONY: gtk3
gtk3:
	$(call symlink_dir,$(CURDIR)/gtk3,~/.config/gtk-3.0)

.PHONY: lftp
lftp:
	ln -sf $(CURDIR)/lftp/rc ~/.lftprc

.PHONY: gnome
gnome:
	dconf load / < $(CURDIR)/gnome/gnome-backup.conf

.PHONY: i3-standalone
i3-standalone: i3 i3status
	ln -sf $(CURDIR)/xorg/xinitrc ~/.xinitrc
	ln -sf $(CURDIR)/xorg/Xresources ~/.Xresources

.PHONY: unlink-all
unlink-all:
	find ~ -lname "$(CURDIR)/*" -delete
