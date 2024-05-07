export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export COLORTERM=truecolor

# path stuff
export PATH=$PATH:~/.bin:~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:~/code/lua-language-server/bin
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
. /usr/share/powerline/bindings/zsh/powerline.zsh

. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

# antigen
source ~/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
asdf
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
shrink-path
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

# local stuff
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

# ripgrep
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# aliases
alias j=z
alias m="rake db:migrate db:test:prepare"
alias v="nvim"
alias cat="bat"
alias up="docker-compose up"
alias dc="docker-compose"
alias dcr="docker-compose run"
alias dcrw="docker-compose run web"
alias fm="foreman start -f Procfile.local"

eval "$(direnv hook zsh)" 
alias luamake=/home/lunks/code/lua-language-server/3rd/luamake/luamake

eval $(ssh-agent -s) > /dev/null
ssh-add > /dev/null

complete -C '/usr/local/bin/aws_completer' aws
. "$HOME/.cargo/env"
