## dotfiles

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

```
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

`make all` で brew bundle（全パッケージインストール）と dotfiles 展開を一括実行。

---

## make コマンド

| コマンド | 内容 |
|---------|------|
| `make all` | `brew bundle` + dotfiles 展開（新規セットアップ用）|
| `make install` | `brew bundle` のみ（Brewfile 更新時）|
| `make setup` | dotfiles 展開のみ（日常的な更新時）|

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