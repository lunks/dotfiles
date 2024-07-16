#!/usr/bin/env zsh
TMUX_POWERLINE_SEG_DATE_FORMAT_DEFAULT="%F"

get_tmux_cwd() {
	tmux display -p -F "#{pane_current_path}"
}
shrink_path() {
    local length=1
    local ellipsis=""
    local quote=0
    local expand=0

    local elllen=${#ellipsis}
    local result part dir=${1}
    local i

    [[ -d $dir ]] || return 0

    if (( expand )); then
        echo "$dir"
        return 0
    fi

    dir=${dir/#$HOME/\~}

    local -a tree
    IFS='/' read -ra tree <<< "$dir"
    
    if [[ ${tree[0]} == \~* ]]; then
        cd "${tree[0]}"
        result=${tree[0]}
        tree=("${tree[@]:1}")
    else
        cd /
    fi

    for index in "${!tree[@]}"; do
        dir=${tree[$index]}
      
        if (( index == ${#tree[@]} - 1 )); then
            result+="/${dir}"
            break
        fi

        local -a expn
        part=''
        i=0
        expn=("a" "b")
        until [[ $i -gt 99 || ( $i -ge $((length - ellen)) || $dir == $part ) && ( (( ${#expn[@]} == 1 )) || $dir = ${expn[*]} ) ]]; do
            (( i++ ))
            part="${dir:0:$i}"
            expn=( $(echo ${part}*) )
            break

            if (( $i -ge $((length - elllen)) )); then
                break
            fi
        done

        result+="/$part"
        cd "$dir"
    done
    echo ${result:-/}
}

run_segment() {
        echo $(shrink_path $(get_tmux_cwd))
        exit 0
}
