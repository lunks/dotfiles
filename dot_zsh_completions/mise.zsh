function update_mise_completion() {
    if command -v mise >/dev/null 2>&1; then
        mise completion zsh > ~/.zsh_completions/_mise
    fi
}

function get_mod_time() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        stat -f %m "$1"
    else
        stat -c %Y "$1"
    fi
}

function check_and_update_mise_completion() {
    local last_update_file=~/.zsh_completions/.mise_last_update
    local update_interval=86400 # 24 hours in seconds

    if [[ ! -f $last_update_file ]] || (( $(date +%s) - $(get_mod_time "$last_update_file") > update_interval )); then
        update_mise_completion && touch $last_update_file
    fi
}

check_and_update_mise_completion
