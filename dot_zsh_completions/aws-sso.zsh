function update_aws-sso_completion() {
    if command -v aws-sso >/dev/null 2>&1; then
        aws-sso completions --source > ~/.zsh_completions/_aws-sso
    fi
}

function get_mod_time() {
    local file="$1"
    if stat -c %Y "$file" >/dev/null 2>&1; then
        # GNU stat (Linux)
        stat -c %Y "$file"
    elif stat -f %m "$file" >/dev/null 2>&1; then
        # BSD stat (macOS)
        stat -f %m "$file"
    else
        echo "0"
    fi
}

function check_and_update_aws-sso_completion() {
    local last_update_file=~/.zsh_completions/.aws-sso_last_update
    local update_interval=86400 # 24 hours in seconds

    if [[ ! -f $last_update_file ]] || (( $(date +%s) - $(get_mod_time "$last_update_file") > update_interval )); then
        update_aws-sso_completion && touch $last_update_file
    fi
}

check_and_update_aws-sso_completion
