# Copied from https://github.com/catppuccin/zsh-syntax-highlighting
# Alterations:
#   - Swapped green (#a6da95) with mauve (#c6a0f6)
#   - Made path separators white like the rest of the path instead of red

# Catppuccin Macchiato Theme (for zsh-syntax-highlighting)
#
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#5b6078'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#c6a0f6'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#c6a0f6'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#c6a0f6'
ZSH_HIGHLIGHT_STYLES[function]='fg=#c6a0f6'
ZSH_HIGHLIGHT_STYLES[command]='fg=#c6a0f6'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#c6a0f6,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#f5a97f,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#f5a97f'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#f5a97f'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#a6da95'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#c6a0f6'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#c6a0f6'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#c6a0f6'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#ed8796'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#ed8796'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#ed8796'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#ed8796'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#eed49f'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#eed49f'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#eed49f'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#ee99a0'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#eed49f'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#ee99a0'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#eed49f'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#ee99a0'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#cad3f5'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ee99a0'
ZSH_HIGHLIGHT_STYLES[path]='fg=#cad3f5,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#cad3f5,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#cad3f5,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#cad3f5,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#a6da95'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#ee99a0'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[default]='fg=#cad3f5'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#cad3f5'
