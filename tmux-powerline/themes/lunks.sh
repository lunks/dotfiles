# If changes made here does not take effect, then try to re-create the tmux session to force reload.

if patched_font_in_use; then
  TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
  TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
  TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
  TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
else
  TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
  TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
  TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
  TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'235'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# See man tmux.conf for additional formatting options for the status line.
# The `format regular` and `format inverse` functions are provided as conveniences

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_CURRENT ]; then
  TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
  "#[fg=$(__normalize_color "$TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR"),bg=#f0bf4f,bold,noitalics,nounderscore]" \
    "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR" \
    " #I#F " \
    "$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN" \
    " #W " \
    "#[bg=$(__normalize_color "$TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR"),fg=#f0bf4f,nobold,noitalics,nounderscore]" \
    "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
  )
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_STYLE ]; then
  TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
  "#[bg=$(__normalize_color "$TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR"),fg=#ff0000,nobold,noitalics,nounderscore]" \
)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_FORMAT ]; then
  TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
  "#[bg=$(__normalize_color "$TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR"),fg=#808080,nobold,noitalics,nounderscore]" \
    "  #I#{?window_flags,#F, } " \
    "$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN" \
    "#[bg=$(__normalize_color "$TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR"),fg=#f0bf4f,nobold,noitalics,nounderscore]" \
    " #W "
  )
fi

# Format: segment_name background_color foreground_color [non_default_separator] [separator_background_color] [separator_foreground_color] [spacing_disable] [separator_disable]
#
# * background_color and foreground_color. Formats:
#   * Named colors (chech man page of tmux for complete list) e.g. black, red, green, yellow, blue, magenta, cyan, white
#   * a hexadecimal RGB string e.g. #ffffff
#   * 'default' for the defalt tmux color.
# * non_default_separator - specify an alternative character for this segment's separator
# * separator_background_color - specify a unique background color for the separator
# * separator_foreground_color - specify a unique foreground color for the separator
# * spacing_disable - remove space on left, right or both sides of the segment:
#   * "left_disable" - disable space on the left
#   * "right_disable" - disable space on the right
#   * "both_disable" - disable spaces on both sides
#   * - any other character/string produces no change to default behavior (eg "none", "X", etc.)
#
# * separator_disable - disables drawing a separator on this segment, very useful for segments
#   with dynamic background colours (eg tmux_mem_cpu_load):
#   * "separator_disable" - disables the separator
#   * - any other character/string produces no change to default behavior
#
# Example segment with separator disabled and right space character disabled:
# "hostname 33 0 {TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} 33 0 right_disable separator_disable"
#
# Note that although redundant the non_default_separator, separator_background_color and
# separator_foreground_color options must still be specified so that appropriate index
# of options to support the spacing_disable and separator_disable features can be used

 #  #F0BF4F
 # ('#000000', '#f0bf4f'),
 # ('#ffffff', '#330000'),
 # ('#9e9e9e', '#1c1c1c'),
 # ('#000000', '#d0d0d0'),
 # ('#9e9e9e', '#121212'),
 # ('#bcbcbc', '#303030'),
 # ('#8a8a8a', '#585858'),
 # ('#626262', '#1c1c1c'),
 # ('#ffcc00', '#cc3300'),
 # ('#800000', '#1c1c1c'),
 # ('#d0d0d0', '#585858'),
 # ('#ffff66', '#1c1c1c'),
 # ('#ffcc00', '#303030'),
 # ('#ffffff', '#585858'),
 # ('#8a8a8a', '#303030'),
 # ('#1c1c1c', '#ffffcc'),
 # ('#d0d0d0', '#000000'),
 # ('#ffffff', '#3399cc'),
 # ('#d0d0d0', '#1c1c1c'),
 # ('#ffffff', '#006699'),
 # ('#bcbcbc', '#585858'),
 # ('#ffffff', '#1c1c1c'),
 # ('#ffffff', '#003300'),
 # ('#66ccff', '#1c1c1c'),
 # ('#ffffff', '#cc0000')
 if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
   TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
   #"tmux_session_info #f9f5d7 #1d2021" \
   "hostname #f9f5d7 #1d2021" \
     #"ifstat 30 255" \
        #"ifstat_sys 30 255" \
        #"lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
        #"wan_ip 24 255" \
        #"vcs_branch 29 88" \
        #"vcs_compare 60 255" \
        #"vcs_staged 64 255" \
        #"vcs_modified 9 255" \
        #"vcs_others 245 0" \
      )
 fi

 if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
   TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
   #"earthquake 3 0" \
   "custom_pwd #626262 #1c1c1c" \
     #"macos_notification_count 29 255" \
        #"mailcount 9 255" \
        #"cpu 240 136" \
        "load #8a8a8a #303030" \
          "now_playing #9e9e9e #121212" \
          #"tmux_mem_cpu_load 234 136" \
                  #"battery 137 127" \
                  #"weather 37 255" \
                  #"rainbarf 0 ${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR}" \
                  #"xkb_layout 125 117" \
                  #"date_day 235 136" \
                  #"date 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
                  #"time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
                  #"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
                )
 fi
