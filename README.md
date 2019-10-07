## dotfiles

## init

```bash
xcode-select --install && \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  && \
brew tap homebrew/cask-versions && \
brew install caskroom/cask/brew-cask && \
brew cask install adoptopenjdk8 && \
brew cask install google-chrome && \
brew cask install  firefox && \
brew cask install atom && \
brew cask install visual-studio-code && \
brew cask install java  && \
brew cask install google-japanese-ime && \
brew cask install slack && \
brew cask install karabiner-elements && \
brew cask install skitch && \
brew cask install virtualbox && \
brew cask install vagrant && \
brew install git go ffmpeg graphviz plantuml peco fd jq nvm bzr mkcert tfenv awscli swagger-codegen direnv tmux wget ghq git-secrets　&& \
git config --global user.name "smith-30" && \
git config --global user.email smith-30@example.com && \
git secrets --install ~/.git-templates/git-secrets && \
git config --global init.templatedir '~/.git-templates/git-secrets'
```

```bash
cd && \
touch .bash_profile && \
mkdir .ssh && \
chmod 700 ~/.ssh && \
ssh-keygen -t rsa -b 4096 -C "smith-30@example.com" -f ~/.ssh/id_rsa && \
chmod 400 ~/.ssh/id_rsa
```

```bash
mkdir ~/Project && \
cd ~/Project && \
git clone git@github.com:smith-30/dotfiles.git && \
cd dotfiles && \
make setup
```

## misc

[vscode changelog](https://github.com/axetroy/vscode-changelog-generator)