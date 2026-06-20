CHEZMOI ?= chezmoi
CHEZMOI_SOURCE := $(CURDIR)

.PHONY: all install bootstrap setup diff dry-run

# 新規Mac向け: brew bundle → 初期セットアップ → dotfiles 展開を一括実行
all: install bootstrap setup

# パッケージ一括インストール（初回または Brewfile 更新時）
install:
	brew bundle

# NOTE: This changes the registry for the current user (updates ~/.npmrc). 
# It may affect other projects. https://github.com/flatt-security/setup-takumi-guard-npm
# npm config set registry https://npm.flatt.tech/ --location=user

# 初回または明示的に必要なときだけ実行するグローバル設定
bootstrap:
	git config --global ghq.root ~/go/src
	cd && git clone git@github.com:b4b4r07/enhancd.git 2>/dev/null || true
	zsh -i -c "nvm install --lts --default"
	npm config set registry https://npm.flatt.tech/ --location=user
	npm install -g opencommit
	oco config set OCO_EMOJI=true
	oco config set OCO_LANGUAGE=ja
	# secretlint: global install
	npm install -g secretlint @secretlint/secretlint-rule-preset-recommend
	# git template dir に secretlint hook を配置
	mkdir -p ~/.git-templates/default/hooks
	git config --global init.templatedir ~/.git-templates/default
	install -m 0755 hooks/pre-commit ~/.git-templates/default/hooks/pre-commit
	# dotfiles リポジトリ自体にも hook を適用 (prek で管理)
	prek install

# dotfiles の展開（日常的な更新にも使う）
setup:
	$(CHEZMOI) apply --source "$(CHEZMOI_SOURCE)"

# 展開前に差分を確認する
diff:
	$(CHEZMOI) diff --source "$(CHEZMOI_SOURCE)"

# 実際には書き込まずに展開内容を確認する
dry-run:
	$(CHEZMOI) apply --source "$(CHEZMOI_SOURCE)" --dry-run --verbose
