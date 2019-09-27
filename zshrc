export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=/usr/local/bin/nvim
export COLORTERM=truecolor

# autocompletion from brew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

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
osx
ruby
rails
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
Tarrasch/zsh-bd
zsh-users/zaw
EOBUNDLES
antigen theme lunks/minimim
antigen apply

# path stuff
export PATH=~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# android
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home

# power line
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# mmv (mmv *.c.orig orig/*.c)
autoload -U zmv
alias mmv='noglob zmv -W'

# git stuff
eval "$(hub alias -s)"
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# asdf
. $(brew --prefix asdf)/asdf.sh

# autojump
. /usr/local/etc/profile.d/z.sh

powerline-daemon -q
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# local stuff
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

# aliases
alias j=z
alias plug="nvim +PlugInstall +PlugUpdate +PlugClean!"
alias m="rake db:migrate db:test:prepare"
alias v="nvim"
alias cat="bat"

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
    exec tmux attach -t $session_num -u
  else
    exec tmux -u
  fi
fi
