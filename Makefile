.PHONY: all install setup

# 新規Mac向け: brew bundle → dotfiles 展開を一括実行
all: install setup

# パッケージ一括インストール（初回または Brewfile 更新時）
install:
	brew bundle

# dotfiles の展開（日常的な更新にも使う）
setup:
	cp .zshrc ~/.zshrc
	cp .czrc ~/.czrc
	cp .cz-config.js ~/.cz-config.js
	cp .git-completion.bash ~/.git-completion.bash
	cp .git-prompt.sh ~/.git-prompt.sh
	cp .vimrc ~/.vimrc
	cp .gvimrc ~/.gvimrc
	cp .tmux.conf ~/.tmux.conf
	mkdir -p ~/.config/karabiner && cp karabiner.json ~/.config/karabiner/karabiner.json
	mkdir -p ~/.tmuxp && cp tmuxp-example.yaml ~/.tmuxp/tmuxp-example.yaml
	git config --global ghq.root ~/go/src
	cd && git clone git@github.com:b4b4r07/enhancd.git 2>/dev/null || true
	source ~/.zshrc; nvm install --lts --default
	npm install -g opencommit
	oco config set OCO_EMOJI=true
	oco config set OCO_LANGUAGE=ja
