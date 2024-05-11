#!/usr/bin/env zsh

if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.14.0
fi

. "$HOME/.asdf/asdf.sh"

asdf update

languages=(
erlang
elixir
golang
nodejs
ruby
rust
)

asdf plugin update --all

for language in "${languages[@]}"; do
  asdf plugin add $language
  asdf install $language latest
done


asdf install nodejs 20.12.2
