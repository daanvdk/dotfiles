bindkey -v
EDITOR=hx
PATH="/Users/daan/.local/bin:$PATH"

source ~/.config/zsh/yazi-shell-wrapper.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source ~/.config/zsh/catppuccin_macchiato-fzf.zsh
source <(fzf --zsh)

function zvm_config() {
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
}
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autosuggestions-abbreviations-strategy/zsh-autosuggestions-abbreviations-strategy.zsh
ZSH_AUTOSUGGEST_STRATEGY=( abbreviations $ZSH_AUTOSUGGEST_STRATEGY )

source ~/.config/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
