# Phoenix + Ash + Svelte + Flowbite Demo

<img alt='Phoenix' src="https://seeklogo.com/images/P/phoenix-logo-D15F067911-seeklogo.com.png" height=40 width=45><img alt='ash' align="top" src="https://ash-hq.org/images/ash-logo-side.svg" height=50 width=100><nbsp><img alt='Svelte' src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Svelte_Logo.svg" height=45 width=45><img alt='Flowbite' src="https://flowbite.com/docs/images/logo.svg" height=45 width=45><img alt='Flowbite-Svelte' src="https://flowbite-svelte.com/images/flowbite-svelte-icon-logo.svg" height=45 width=45><img alt='Tailwind CSS' src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/1200px-Tailwind_CSS_Logo.svg.png" height=45 width=45>

## Introduction

A sample web browser application demonstrating:

- [x] [Phoenix](https://www.phoenixframework.org/) 1.7
- [x] [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html) 0.18 
- [x] [Ash](https://ash-hq.org) 2.6
  - [x] [Ash Authentication](https://github.com/team-alembic/ash_authentication)
  - [x] [Phlegethon Ash Extensions](https://github.com/frankdugan3/phlegethon) 
- [x] [Svelte](https://svelte.dev) via [LiveSvelte](https://github.com/woutdp/live_svelte)
- [x] [Flowbite](https://flowbite.com) components
- [x] [Flowbite-Svelte](https://flowbite-svelte.com) components

## Features

- Toggle dark and light themes
- Login screen with users and hashed passwords in Postgres
- [Svelte component](https://github.com/woutdp/live_svelte#create-a-svelte-component) similar to the [increment/decrement example](https://svelte.dev/repl/65fc4b475b884dcba414139848ff02ef). It communicates with the backend via Websockets.
- [Flowbite Date Picker](https://flowbite.com/docs/plugins/datepicker/) (supports dark mode!)
- [Flowbite-Svelte Checkbox](https://flowbite-svelte.com/forms/checkbox)

## License

MIT

## Help and additional information

Join us on [Discord](https://discord.com/invite/D7FNG2q)

## Requirements

### Postgres

[Installing Postgres](https://www.postgresql.org/docs/current/tutorial-install.html)

### nvm

- [Install nvm](https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm/blob/master/README.md#install--update-script)
- Restart your terminal

### Elixir

Restart your terminal after installing Elixir.

#### MacOS

- [Install Homebrew](https://docs.brew.sh/Installation)
- Restart your terminal

You can use `brew` to install Elixir but `asdf` is preferred by the Elixir community.

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
KERL_BUILD_DOCS=yes asdf install erlang 25.3 # For VSCode's Elixir language server extension
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
mix local.hex
mix setup
# Register the version of esbuild installed by npm
mix esbuild.install
mix phx.server
```

Open a browser to http://localhost:4000

## Notes
  
1. Views that use most Flowbite-Svelte components should use ssr={false}; otherwise, runtime errors will occur
  
## References

### Guides

1. [Install Phoenix](https://hexdocs.pm/phoenix/installation.html)
2. [Install Ash Authentication](https://hexdocs.pm/ash_authentication_phoenix/getting-started-with-ash-authentication-phoenix.html)
3. [Install Phlegethon](https://github.com/frankdugan3/phlegethon/blob/main/documentation/tutorials/get-started.md)
4. [Install LiveSvelte](https://github.com/woutdp/live_svelte/blob/master/README.md)
5. [Install Flowbite](https://flowbite.com/docs/getting-started/phoenix/)
6. [Install Flowbite-Svelte](https://medium.com/mkdir-awesome/getting-started-with-flowbite-svelte-37b086ce9db5)

### Other

1. [Phoenix and Third-Party JS Packages](https://hexdocs.pm/phoenix/asset_management.html)
2. [Getting Started: Phoenix 1.7 with Svelte](https://medium.com/@alistairisrael/phoenix-1-7-with-svelte-12257d853ed1)
3. [LiveSvelte - E2E reactivity in LiveView with Svelte](https://elixirforum.com/t/livesvelte-e2e-reactivity-in-liveview-with-svelte/54822/4)

## TODO

1. Upgrade flowbite-svelte - see [#647](https://github.com/themesberg/flowbite-svelte/issues/647)
2. Sync styles between Svelte and Phlegethon components - [see here](https://github.com/woutdp/live_svelte/discussions/28#discussioncomment-5575058)
