## Introduction

This is a Phoenix 1.7 LiveView project that combines:

- Ash Framework (with Phlegethon)
- Svelte
- Flowbite

## Requirements

- Erlang
- Elixir
- Postgres

## Installing Erlang and Elixir

### MacOS

```sh
brew install asdf
# Find the current versions of erlang and elixir
# asdf list-all erlang
# asdf list-all elixir
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
asdf plugin add erlang
KERL_BUILD_DOCS=yes asdf install erlang 25.3 # For VSCode extension
asdf global erlang 25.3
asdf plugin add elixir
asdf install elixir 1.14.4-otp-25
asdf global elixir 1.14.4-otp-25
```

## Usage

```sh
git clone ...
mix setup
mix ecto.migrate
mix phx.server
```

Open a browser to http://localhost:4000

### Svelte example

Go to http://localhost:4000/svelte
