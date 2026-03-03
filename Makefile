.PHONY: all install setup

# 新規Mac向け: brew bundle → dotfiles 展開を一括実行
all: install setup

# パッケージ一括インストール（初回または Brewfile 更新時）
install:
	brew bundle

# NOTE: This changes the registry for the current user (updates ~/.npmrc). 
# It may affect other projects. https://github.com/flatt-security/setup-takumi-guard-npm
# npm config set registry https://npm.flatt.tech/ --location=user

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
	mkdir -p ~/.config/git && cp gitignore_global ~/.config/git/ignore
	git config --global ghq.root ~/go/src
	cd && git clone git@github.com:b4b4r07/enhancd.git 2>/dev/null || true
	zsh -i -c "nvm install --lts --default"
	npm config set registry https://npm.flatt.tech/ --location=user
	npm install -g opencommit
	oco config set OCO_EMOJI=true
	oco config set OCO_LANGUAGE=ja
	# secretlint: global install
	npm install -g secretlint @secretlint/secretlint-rule-preset-recommend
	# secretlint: global config
	cp .secretlintrc.json ~/.secretlintrc.json
	# git-secrets hook を設置してから secretlint combined hook で上書き
	git secrets --install ~/.git-templates/git-secrets
	git config --global init.templatedir ~/.git-templates/git-secrets
	git secrets --register-aws
	cp hooks/pre-commit ~/.git-templates/git-secrets/hooks/pre-commit
	chmod +x ~/.git-templates/git-secrets/hooks/pre-commit
	# dotfiles リポジトリ自体にも hook を適用
	mkdir -p .git/hooks
	cp hooks/pre-commit .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit
