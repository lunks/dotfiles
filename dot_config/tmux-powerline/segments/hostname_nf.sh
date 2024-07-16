# shellcheck shell=bash
run_segment() {
	local opts=""
	if [ "$TMUX_POWERLINE_SEG_HOSTNAME_FORMAT" == "short" ]; then
		if shell_is_osx || shell_is_bsd; then
			opts="-s"
		else
			opts="--short"
		fi
	fi
# 
        echo "󰟒 $(hostname ${opts})"
	return 0
}
