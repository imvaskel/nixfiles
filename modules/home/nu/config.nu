# Nushell Config File
#
# version = "0.98.0"

$env.config = {
    show_banner: false
    buffer_editor: nvim
    keybindings: [
        {
            name: sudo_last,
            modifier: alt,
            keycode: char_s,
            mode: emacs,
            event: [
                { edit: Clear }
                { send: PreviousHistory }
                { edit: MoveToLineStart }
                { edit: InsertString value: "sudo " }
            ]
        },
    ]
}

$env.TRANSIENT_PROMPT_COMMAND = {|| starship module character }

alias la = ls -a
alias ll = ls -l
alias lla = ls -la

alias compose = docker compose
alias up = docker compose up
alias upd = docker compose up -d
alias down = docker compose down
alias downd = docker compose down

use ~/.cache/starship/init.nu
