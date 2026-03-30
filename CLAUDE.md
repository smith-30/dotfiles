# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal macOS dotfiles repository. Files here are copied directly to `$HOME` via `make setup`. There is no build step — edits to files in this repo take effect after re-running `make setup` (or sourcing/copying the specific file manually).

## Deployment

```bash
make setup        # Copy all dotfiles to $HOME and run initial setup
```

To apply a single file without full setup:
```bash
cp .zshrc ~/.zshrc && source ~/.zshrc
cp .tmux.conf ~/.tmux.conf  # then reload: tmux source ~/.tmux.conf
```

## Brewfile Management

```bash
brew bundle           # Install packages from Brewfile
brew bundle dump      # Regenerate Brewfile from currently installed packages
brew bundle cleanup   # Remove packages not in Brewfile
brew update && brew upgrade
```

## File Roles

| File | Purpose |
|------|---------|
| `.zshrc` | Shell config: aliases, prompt, keybindings, history, tool init (zoxide, enhancd, nvm, fzf) |
| `.tmux.conf` | tmux config: vim-style navigation, copy mode, status bar |
| `Brewfile` | Declarative list of all Homebrew packages, casks, and mas apps |
| `.vimrc` / `.gvimrc` | Vim configuration |
| `.czrc` / `.cz-config.js` | Commitizen configuration for conventional commits |
| `tmuxp-example.yaml` | Example tmuxp session layout (copy to `~/.tmuxp/` to use) |
| `karabiner.json` | Karabiner-Elements key remapping config |

## Key Tools in the Stack

- **zoxide** — smart `cd` replacement (invoked via `z`)
- **enhancd** — enhanced `cd` with fuzzy filtering (via `sk`/`skim`)
- **fzf / sk** — fuzzy finder; `^r` bound to fzf history search in zsh
- **tmuxp** — YAML-based tmux session management (`tmuxp load <session>`)
- **lazygit / lazydocker / lazynpm** — TUI wrappers for git, Docker, npm
- **ghq** — repository management (root: `~/go/src`)
- **mise** — polyglot runtime version manager
- **opencommit (oco)** — AI commit message generation (configured for Japanese + emoji)

## Tmux Key Bindings (notable customizations)

- Prefix: `Ctrl-b` (default)
- Pane navigation: `prefix + h/j/k/l` or `Option + arrow keys`
- Split horizontal: `prefix + |`, vertical: `prefix + -`
- Copy mode uses vi keys; `v` begins selection, `y` yanks
