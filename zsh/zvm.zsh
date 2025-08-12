function zvm_config() {
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
}

function zvm_after_init() {
    antidote load ~/.zsh_plugins_after_zvm.txt

    # fzf
    source <(fzf --zsh)
    bindkey '^I' fzf_completion
}
