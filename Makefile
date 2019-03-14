.PHONY: setup

setup:
	cp .bash_profile ~/.bash_profile
	cp .git-completion.bash ~/.git-completion.bash
	cp .git-prompt.sh ~/.git-prompt.sh
	cp .vimrc ~/.vimrc
	cp .gvimrc ~/.gvimrc
	git config --global ghq.root ~/go/src
	cd && git clone git@github.com:b4b4r07/enhancd.git
	source ~/.bash_profile
