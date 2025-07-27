SHELL=/bin/bash

HOME_DIR := $(HOME)
VIM_DIR := $(HOME)/.vim
VUNDLE_DIR := $(HOME)/.vim/bundle/Vundle.vim

help:
	@echo "Prerequisite"
	@echo " Generate ssh key and add to github site"
	@echo " Install brew"

.PHONY: all
all: install brew dev-deps $(VUNDLE_DIR) install-pg

brew:
	brew update

$(VUNDLE_DIR):
	git clone https://github.com/VundleVim/Vundle.vim.git $(VIM_DIR)/bundle/Vundle.vim

dev-deps:
	brew install tmux htop reattach-to-user-namespace the_silver_searcher
	curl -LsSf https://astral.sh/uv/install.sh | sh

install: brew $(VUNDLE_DIR) dev-deps
	cp .bash_profile .bashrc .vimrc .tmux.conf .gitconfig $(HOME_DIR)

	# install vbundle plugin in vim and quit
	vim -c "BundleInstall" -c "q" -c "q"

	@echo "setup successful!"

install-pg:
	brew install postgresql
