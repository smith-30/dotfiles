## dotfiles

macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## init

### 1. Homebrew をインストール

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. SSH キーを生成して GitHub に登録

```bash
cd && mkdir -p .ssh && chmod 700 ~/.ssh && \
ssh-keygen -t ed25519 -C "smith-30@example.com" -f ~/.ssh/my-github-id_rsa && \
chmod 400 ~/.ssh/my-github-id_rsa
```

`~/.ssh/config` に追記：

```sshconfig
Host github github.com
    HostName github.com
    IdentityFile ~/.ssh/my-github-id_rsa
    User git
```

公開鍵（`~/.ssh/my-github-id_rsa.pub`）を GitHub に登録する。

### 3. git 設定

```bash
git config --global user.name "smith-30" && \
git config --global user.email smith-30@example.com
```

### 4. dotfiles をクローンしてセットアップ

```bash
mkdir -p ~/Project && cd ~/Project && \
git clone git@github.com:smith-30/dotfiles.git && \
cd dotfiles && make all
```

`make all` で Homebrew パッケージのインストール、初期セットアップ、chezmoi による dotfiles 展開を一括実行する。

## Structure

```text
dot_zshrc                         # ~/.zshrc
dot_tmux.conf                     # ~/.tmux.conf
dot_vimrc                         # ~/.vimrc
dot_gvimrc                        # ~/.gvimrc
dot_czrc                          # ~/.czrc
dot_cz-config.js                  # ~/.cz-config.js
dot_git-completion.bash           # ~/.git-completion.bash
dot_git-prompt.sh                 # ~/.git-prompt.sh
dot_secretlintrc.json             # ~/.secretlintrc.json
.secretlintrc.json                # リポジトリ用 secretlint 設定（prek hook から参照）
prek.toml                         # prek Git hook 設定
dot_config/git/ignore             # ~/.config/git/ignore
dot_config/ghostty/config         # ~/.config/ghostty/config
dot_config/karabiner/karabiner.json # ~/.config/karabiner/karabiner.json
dot_tmuxp/tmuxp-example.yaml      # ~/.tmuxp/tmuxp-example.yaml
dot_claude/                       # ~/.claude/
dot_vscode/                       # ~/.vscode/
```

## make コマンド

| コマンド | 内容 |
|---------|------|
| `make all` | `brew bundle` + 初期セットアップ + chezmoi 展開（新規セットアップ用）|
| `make install` | `brew bundle` のみ（Brewfile 更新時）|
| `make bootstrap` | global git/npm 設定、nvm、npm global tools、git hook 設定、prek install |
| `make setup` | `chezmoi apply` で dotfiles を展開 |
| `make diff` | `chezmoi diff` で展開前の差分確認 |
| `make dry-run` | `chezmoi apply --dry-run --verbose` で展開内容を確認 |

## Git hooks (prek)

[prek](https://github.com/j178/prek) で Git hook を管理する。設定は `prek.toml` に定義されており、コミット時に secretlint が実行される。

```bash
# hook のインストール（make bootstrap で自動実行される）
prek install

# 全ファイルに対して手動実行
prek run --all-files

# hook のアンインストール
prek uninstall
```

### 設定済み hook

| hook | タイミング | 内容 |
|------|-----------|------|
| secretlint | pre-commit | シークレット・APIキーの漏洩チェック |

## chezmoi

```bash
# 差分確認
make diff

# 実際には書き込まずに確認
make dry-run

# dotfiles 展開
make setup
```

このリポジトリの root を chezmoi source directory として扱う。`README.md` や `Makefile` など、ホームディレクトリへ展開しないファイルは `.chezmoiignore` で除外する。

## brew 周り

```bash
# Brewfile作成
$ brew bundle dump

# 定期アップデート
$ brew update
$ brew upgrade

# 編集反映
$ brew bundle cleanup

# 削除
$ brew uninstall vim

# 現在の設定を dump
$ brew bundle dump \
    --file="Brewfile.generated" \
    --force \
    --describe
```

## App Store

- Amphetamine
