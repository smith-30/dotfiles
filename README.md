## dotfiles

## init

```
xcode-select --install && \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  && \
brew install caskroom/cask/brew-cask && \
brew cask install google-chrome && \
brew cask install  firefox && \
brew cask install atom && \
brew cask install visual-studio-code && \
brew cask install java  && \
brew cask install google-japanese-ime && \
brew cask install slack && \
brew cask install karabiner-elements && \
brew cask install skitch && \
brew install git go ffmpeg graphviz plantuml peco fd jq nvm
```

```
cd && \
touch .bash_profile && \
mkdir .ssh && \
chmod 700 ~/.ssh && \
ssh-keygen -t rsa -b 4096 -C "misu@example.com" -f ~/.ssh/id_rsa && \
chmod 400 ~/.ssh/id_rsa
```

```
mkdir ~/Project && \
cd ~/Project && \
git clone git@github.com:smith-30/dotfiles.git && \
cd dotfiles && \
make setup
```
