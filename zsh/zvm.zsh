function zvm_config() {
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
}

function zvm_after_init() {
    antidote load ~/.zsh_plugins_after_zvm.txt

    # fzf
    source <(fzf --zsh)
    bindkey '^I' fzf_completion

    # zsh-abbr suggestions
    ZSH_AUTOSUGGEST_STRATEGY=abbr_history

    # zsh-abbr highlighting
    (( ${#ABBR_REGULAR_USER_ABBREVIATIONS} )) && {
        ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
        ZSH_HIGHLIGHT_REGEXP=('^[[:blank:][:space:]]*('${(j:|:)${(Qk)ABBR_REGULAR_USER_ABBREVIATIONS}}')$' 'fg=#8aadf4')
    }
}
