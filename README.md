## dotfiles

## init

- brew 入れる
  - https://brew.sh/
- set brewfile
- brew bundle
- set .zshrc
- git設定
- git clone git@github.com:smith-30/dotfiles.git
- cd dotfiles
- make setup

```bash
git config --global user.name "smith-30" && \
git config --global user.email smith-30@example.com && \
git secrets --install ~/.git-templates/git-secrets && \
git config --global init.templatedir '~/.git-templates/git-secrets'
```

```bash
cd && \
touch .zshrc && \
mkdir .ssh && \
chmod 700 ~/.ssh && \
ssh-keygen -t rsa -b 4096 -C "smith-30@example.com" -f ~/.ssh/my-github-id_rsa && \
chmod 400 ~/.ssh/my-github-id_rsa
```

```
$ vi ~/.ssh/config
Host github github.com
    HostName github.com
    IdentityFile ~/.ssh/my-github-id_rsa
    User git
```

```bash
mkdir ~/Project && \
cd ~/Project && \
git clone git@github.com:smith-30/dotfiles.git && \
cd dotfiles && \
make setup
```

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
```

## App Store

- Amphetamine