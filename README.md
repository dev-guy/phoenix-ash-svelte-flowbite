# Phoenix LiveView Ash Svelte Flowbite Example

## Introduction

This is a Phoenix 1.7 LiveView project that combines:

- [x] [Ash Framework](https://ash-hq.org) with [Ash Authentication](https://github.com/team-alembic/ash_authentication) and [Phlegethon UX Extensions](https://github.com/frankdugan3/phlegethon) 
- [x] Svelte via [LiveSvelte](https://github.com/woutdp/live_svelte)
- [ ] Flowbite

## Features

- Dark/light mode toggling
- Login screen

## Requirements

### Install Postgres

### Install Erlang and Elixir

#### MacOS

```sh
brew install asdf
# Find the current versions of erlang and elixir:
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
git clone https://github.com/dev-guy/ash-svelte-flowbite.git
cd ash-svelte-flowbite
mix setup
mix ecto.migrate
mix phx.server
```

Open a browser to http://localhost:4000

### Svelte example

Go to http://localhost:4000/svelte

This is similar to the [basic number increment/decrement example](https://svelte.dev/repl/65fc4b475b884dcba414139848ff02ef?version=3.29.0).

## References

1. [Install Ash Authentication](https://hexdocs.pm/ash_authentication_phoenix/getting-started-with-ash-authentication-phoenix.html)
2. [Install Phlegethon](https://github.com/frankdugan3/phlegethon/blob/main/documentation/tutorials/get-started.md)
3. [Install LiveSvelte](https://github.com/woutdp/live_svelte/blob/master/README.md)
4. [Install Flowbite-Svelte](https://medium.com/mkdir-awesome/getting-started-with-flowbite-svelte-37b086ce9db5)
