export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export COLORTERM=truecolor

# autocompletion from brew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# path stuff
export PATH=~/.bin:~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# antigen
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
aws
bundler
heroku
git
github
git-prompt
macos
ruby
rails
shrink-path
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
Tarrasch/zsh-bd
zsh-users/zaw
skywind3000/z.lua
EOBUNDLES
antigen theme lunks/minimim
antigen apply

# mmv (mmv *.c.orig orig/*.c)
autoload -U zmv
alias mmv='noglob zmv -W'

# git stuff
eval "$(hub alias -s)"
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

. $(brew --prefix asdf)/libexec/asdf.sh

powerline-daemon -q

# local stuff
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

# ripgrep
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# aliases
alias j=z
alias plug="nvim +PlugInstall +PlugUpdate +PlugClean!"
alias m="rake db:migrate db:test:prepare"
alias v="nvim"
alias cat="bat"
alias up="docker-compose up"
alias dc="docker-compose"
alias dcr="docker-compose run"
alias dcrw="docker-compose run web"
function emulator { ( cd "/usr/local/Caskroom/android-sdk/4333796/tools/" && ./emulator "$@"; ) }

# Always use Tmux
if [[ -z "$TMUX" && -z "$VIM" ]]
then
  session_num=$(
    tmux list-sessions |
    grep -v attached |
    grep -oE '^\d+:' |
    grep -oE '^\d+' |
    head -1
  )
  if test $session_num
  then
    exec tmux attach -t $session_num
  else
    exec tmux
  fi
fi
