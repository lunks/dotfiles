function update_chezmoi_completion() {
    if command -v chezmoi >/dev/null 2>&1; then
        chezmoi completion zsh > ~/.zsh_completions/_chezmoi
    fi
}

function check_and_update_chezmoi_completion() {
    local last_update_file=~/.zsh_completions/.chezmoi_last_update
    local update_interval=86400 # 24 hours in seconds

    if [[ ! -f $last_update_file ]] || (( $(date +%s) - $(stat -c %Y $last_update_file) > update_interval )); then
        update_chezmoi_completion && touch $last_update_file
    fi
}

check_and_update_chezmoi_completion
