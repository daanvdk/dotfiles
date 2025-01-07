#!/usr/bin/env zsh
set -e

# Symlinks
typeset -A link_map
link_map=(
    .gitconfig                 ~/.gitconfig
    .zsh_plugins.txt           ~/.zsh_plugins.txt
    .zsh_plugins_after_zvm.txt ~/.zsh_plugins_after_zvm.txt
    .zshrc                     ~/.zshrc
    Brewfile                   ~/Brewfile
    ghostty                    ~/.config/ghostty
    git                        ~/.config/git
    helix                      ~/.config/helix
    starship.toml              ~/.config/starship.toml
    zsh                        ~/.config/zsh
    zsh-abbr                   ~/.config/zsh-abbr
    python                     ~/.local/bin/python
)
for source in "${(@k)link_map}"; do
    target="${link_map[$source]}"
    source="$(realpath $source)"

    echo "Linking $target -> $source"
    mkdir -p "$(dirname $target)"
    ln -hFs $source $target
done

# Install homebrew & homebrew packages
which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install

# Install uv tools
uv tool install -U --with=python-lsp-ruff python-lsp-server
uv tool install -U fibro

# Relaunch
exec zsh
