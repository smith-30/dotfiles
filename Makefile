.PHONY: setup

setup:
	cp .zshrc ~/.zshrc
	cp .czrc ~/.czrc
	cp .cz-config.js ~/.cz-config.js
	cp .git-completion.bash ~/.git-completion.bash
	cp .git-prompt.sh ~/.git-prompt.sh
	cp .vimrc ~/.vimrc
	cp .gvimrc ~/.gvimrc
	git config --global ghq.root ~/go/src
	cd && git clone git@github.com:b4b4r07/enhancd.git
	source ~/.zshrc
	nvm install --lts
