if status is-interactive
    set fish_greeting

    set fish_color_command --bold white
    set fish_color_param white
    set fish_color_operator white
    set fish_color_error --bold red

    abbr -a ts tmux new -s
    abbr -a tl tmux ls
    abbr -a ta tmux attach -t
    abbr -a tk tmux kill-session -t

    alias vi=nvim
    alias vim=nvim

    fish_vi_key_bindings
    starship init fish | source
end
