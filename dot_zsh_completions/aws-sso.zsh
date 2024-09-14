function update_aws-sso_completion() {
    if command -v aws-sso >/dev/null 2>&1; then
        aws-sso completions --source > ~/.zsh_completions/_aws-sso
    fi
}

function check_and_update_aws-sso_completion() {
    local last_update_file=~/.zsh_completions/.aws-sso_last_update
    local update_interval=86400 # 24 hours in seconds

    if [[ ! -f $last_update_file ]] || (( $(date +%s) - $(stat -c %Y $last_update_file) > update_interval )); then
        update_aws-sso_completion && touch $last_update_file
    fi
}

check_and_update_aws-sso_completion
