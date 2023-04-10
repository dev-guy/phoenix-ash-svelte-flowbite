# Phoenix LiveView Ash Svelte Flowbite Starter

## Introduction

This is a [Phoenix](https://www.phoenixframework.org/) 1.7 LiveView example that combines:

- [x] [Ash Framework](https://ash-hq.org) with [Ash Authentication](https://github.com/team-alembic/ash_authentication) and [Phlegethon Ash Extensions](https://github.com/frankdugan3/phlegethon) 
- [x] [Svelte](https://svelte.dev) via [LiveSvelte](https://github.com/woutdp/live_svelte)
- [ ] [Flowbite](https://flowbite.com) components via [Flowbite-Svelte](https://flowbite-svelte.com) (in progress)

## Features

- Dark and light mode buttons
- Login screen
- Users and passwords (hashed) stored in Postgres

## License

MIT

## Credits

This repository was created by [Terris Linenbach](https://genserver.social/Terris) in April 2023 with tremendous amounts of assistance from the friendly Ash community.

## Help and additional information

Join us on [Discord](https://discord.com/invite/D7FNG2q)

## Requirements

### Postgres

[Installation](https://www.postgresql.org/docs/current/tutorial-install.html)

### nvm

- [Install nvm]([https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm/blob/master/README.md#install--update-script)
- Restart your terminal after installing

### Elixir

Restart your terminal after installing.

#### MacOS

First, [install Homebrew](https://docs.brew.sh/Installation) and restart your terminal.

You can use [Homebrew](https://docs.brew.sh) to install Elixir but asdf is the preferred method in the Elixir community.

Either: `brew install elixir` or:

```sh
brew install asdf
# I use zsh. Change the following line to >> ~/.bashrc if you use bash.
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
# Restart your terminal
# Find the current versions of erlang and elixir:
# asdf list-all erlang
# asdf list-all elixir
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
nvm i
mix setup
mix esbuild.install # register the latest version of esbuild
mix phx.server
```

Open a browser to http://localhost:4000

### Svelte example

The example at http://localhost:4000/svelte is similar to the [increment/decrement example](https://svelte.dev/repl/65fc4b475b884dcba414139848ff02ef?version=3.29.0).

## Referencess

1. [Install Phoenix](https://hexdocs.pm/phoenix/installation.html)
2. [Install Ash Authentication](https://hexdocs.pm/ash_authentication_phoenix/getting-started-with-ash-authentication-phoenix.html)
3. [Install Phlegethon](https://github.com/frankdugan3/phlegethon/blob/main/documentation/tutorials/get-started.md)
4. [Install LiveSvelte](https://github.com/woutdp/live_svelte/blob/master/README.md)
5. [Getting Started: Phoenix 1.7 with Svelte](https://medium.com/@alistairisrael/phoenix-1-7-with-svelte-12257d853ed1)
6. [LiveSvelte - E2E reactivity in LiveView with Svelte](https://elixirforum.com/t/livesvelte-e2e-reactivity-in-liveview-with-svelte/54822/4)
7. [Install Flowbite-Svelte](https://medium.com/mkdir-awesome/getting-started-with-flowbite-svelte-37b086ce9db5)
8. [Tailwind CSS Phoenix (Elixir) - Flowbite](https://flowbite.com/docs/getting-started/phoenix/)
