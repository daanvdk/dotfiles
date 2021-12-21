if status is-interactive
    set -gx EDITOR nvim

    set fish_greeting

    set fish_color_command --bold white
    set fish_color_param white
    set fish_color_operator white
    set fish_color_error --bold red
    set fish_color_quote blue

    abbr -a ts tmux new -s
    abbr -a tl tmux ls
    abbr -a ta tmux attach -t
    abbr -a tk tmux kill-session -t

    abbr -a gs git status
    abbr -a gsh git show
    abbr -a gl git log
    abbr -a gd git diff
    abbr -a ga git add
    abbr -a gc git commit
    abbr -a gch git checkout
    abbr -a gpl git pull
    abbr -a gps git push
    abbr -a gm git merge

    abbr -a dc docker-compose

    alias vi=nvim
    alias vim=nvim

    alias ssh="TERM=xterm /usr/bin/ssh"

    fish_vi_key_bindings
    starship init fish | source
end

thefuck --alias | source

set PATH "/Users/daan/Library/Python/3.9/bin:$PATH"
