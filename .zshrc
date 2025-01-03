for file in ~/.config/zsh/*.zsh; do source $file; done

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

autoload -U compinit
compinit
