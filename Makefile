VIM_PLUGINS = ekalinin/Dockerfile.vim \
  evidens/vim-twig \
  mattn/emmet-vim \
  tpope/vim-fugitive \
  airblade/vim-gitgutter \
  Xuyuanp/nerdtree-git-plugin \
  cocopon/iceberg.vim \
  altercation/vim-colors-solarized \
  arcticicestudio/nord-vim \
  scrooloose/nerdtree \
  tpope/vim-surround \
  scrooloose/nerdcommenter \
  vim-airline/vim-airline \
  vim-airline/vim-airline-themes


# ln -sfn does automatically replace existing directories symlinks, but not
# 'real' directories, therefore to be sure everything goes as expected we must
# delete them first.
define symlink_dir
  rm -rf $(2) && ln -s $(1) $(2)
endef

.PHONY: vim
vim:
	ln -sf $(CURDIR)/vim/vimrc ~/.vimrc
	ln -sf $(CURDIR)/vim/gvimrc ~/.gvimrc
	$(call symlink_dir,$(CURDIR)/vim/vim,~/.vim)

	rm -rf ~/.vim/bundle \
	  && mkdir -p ~/.vim/{autoload,bundle} \
	  && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	@for repo in $(VIM_PLUGINS); do \
	  git -C ~/.vim/bundle clone https://github.com/$$repo; \
	done

.PHONY: vim-extra
vim-extra: vim
	git -C ~/.vim/bundle clone https://github.com/neoclide/coc.nvim -b release

.PHONY: mutt
mutt:
	ln -sfn $(CURDIR)/mutt/muttrc ~/.muttrc
	$(call symlink_dir,$(CURDIR)/mutt/mutt,~/.mutt)

.PHONY: tmux
tmux:
	ln -sf $(CURDIR)/tmux/tmux.conf ~/.tmux.conf

.PHONY: xorg
xorg:
	ln -sf $(CURDIR)/xorg/xinitrc ~/.xinitrc
	ln -sf $(CURDIR)/xorg/Xresources ~/.Xresources

.PHONY: i3
i3:
	$(call symlink_dir,$(CURDIR)/i3/i3,~/.config/i3)

.PHONY: i3gaps
i3gaps:
	$(call symlink_dir,$(CURDIR)/i3gaps/i3,~/.config/i3)

.PHONY: i3status
i3status:
	$(call symlink_dir,$(CURDIR)/i3status,~/.config/i3status)

.PHONY: compton
compton:
	ln -sf $(CURDIR)/compton/compton.conf ~/.config/compton.conf

.PHONY: readline
readline:
	ln -sf $(CURDIR)/readline/inputrc ~/.inputrc

.PHONY: bash
bash: readline
	ln -sf $(CURDIR)/bash/bash_profile ~/.bash_profile
	ln -sf $(CURDIR)/bash/bashrc ~/.bashrc

.PHONY: dunst
dunst:
	$(call symlink_dir,$(CURDIR)/dunst,~/.config/dunst)

.PHONY: nitrogen
nitrogen:
	$(call symlink_dir,$(CURDIR)/nitrogen,~/.config/nitrogen)

.PHONY: npm
npm:
	ln -sf $(CURDIR)/npm/npmrc ~/.npmrc

.PHONY: python
python: readline
	ln -sf $(CURDIR)/python/pylintrc ~/.pylintrc
	pip install -r $(CURDIR)/python/packages.txt --user

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

.PHONY: baseconfig
baseconfig: bash python

.PHONY: workstation
workstation: baseconfig vim-extra npm

.PHONY: server
server: baseconfig vim

.PHONY: i3-standalone
i3-standalone: workstation xorg i3 i3status nitrogen dunst

.PHONY: gnome
gnome:  workstation gtk3
	dconf load / < $(CURDIR)/gnome/gnome-backup.conf

.PHONY: unlink-all
unlink-all:
	find ~ -lname "$(CURDIR)/*" -delete
