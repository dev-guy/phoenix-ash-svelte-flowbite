# Phoenix Ash Flowbite Svelte TipTap Mash-Up

<img alt='Phoenix' src="https://seeklogo.com/images/P/phoenix-logo-D15F067911-seeklogo.com.png" height=40 width=45><img alt='ash' align="top" src="https://ash-hq.org/images/ash-logo-side.svg" height=50 width=100><img alt='Tailwind CSS' src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/1200px-Tailwind_CSS_Logo.svg.png" height=45 width=45><img alt='Flowbite' src="https://flowbite.com/docs/images/logo.svg" height=45 width=45><img alt='Svelte' src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Svelte_Logo.svg" height=45 width=45><img alt='Skeleton' height=45 width=45 src="https://pbs.twimg.com/profile_images/1587479781544759297/TINbbJLC_400x400.png"/>

## Introduction

A web browser application demonstrating:

- [x] [Phoenix](https://www.phoenixframework.org/) 1.7 with [TailwindCSS](https://tailwindcss.com) 3.3.1
- [x] [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html) 0.18
- [x] [Ash Framework](https://ash-hq.org) 2.6
- [x] [Ash Authentication](https://github.com/team-alembic/ash_authentication)
  - [x] Login page with users and passwords stored in Postgres without writing any imperative code
- [x] [Pyro](https://hexdocs.pm/pyro/about.html)
  - [x] Toggle dark and light themes
- [x] [Flowbite](https://flowbite.com) Tailwind CSS Components
  - [x] [Flowbite Date Picker](https://flowbite.com/docs/plugins/datepicker/) on the home page
  - Flowbite does not require JavaScript
- [x] [Svelte](https://svelte.dev) via [LiveSvelte](https://wout.space/notes/live-svelte)
  - Svelte delivers many client-side UX niceties such as animations. Combining LiveView and Svelte is 10x!
  - [x] Support Sass/PostCSS
  - [x] [TipTap Editor](https://tiptap.dev/) "dead view". Uses .svelte file instead of ~V sigil.
  - [x] [LiveSvelte Counter](https://github.com/woutdp/live_svelte#create-a-svelte-component) is similar to the [increment/decrement example](https://svelte.dev/repl/65fc4b475b884dcba414139848ff02ef). It communicates with the backend via Websockets. Uses the convenient ~V sigil but frankly until editors understand that ~V is for Svelte, using .svelte files will have a better DX.
- [x] [Svelte Skeleton](https://www.skeleton.dev/) examples on the Skeleton Components page ("dead" view):
  - [Accordion](https://www.skeleton.dev/components/accordions)

## Notes

- Using @apply in `<style>` blocks in Svelte files is [a bad idea](https://tailwindcss.com/docs/functions-and-directives#using-apply-with-per-component-css)

## Video

[Demo (MP4)](https://drive.google.com/file/d/17rqo8kdDJMo3MS_yYRSgk4_7-m3QrYdH/view)

## License

[MIT](LICENSE)

## Help and additional information

Join the [Ash Discord Server](https://discord.com/invite/D7FNG2q)

## Requirements

### Postgres

[Install Postgres](https://www.postgresql.org/docs/current/tutorial-install.html)

### nvm

- [Install nvm](https://github.com/nvm-sh/nvm/blob/master/README.md#install--update-script)
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
mix tailwind.install
mix setup
# Register the version of esbuild installed by npm
mix esbuild.install
mix phx.server
```

Open a browser to http://localhost:4000

## Notes

1. package.json contains JavaScript dependencies that are installed as Hex packages. This is apparently needed for Svelte SSR.

```js
    "live_svelte": "file:../deps/live_svelte",
    "pyro": "file:../deps/pyro",
    "phoenix": "file:../deps/phoenix",
    "phoenix_html": "file:../deps/phoenix_html",
    "phoenix_live_view": "file:../deps/phoenix_live_view"
```

2. Need another component? Add it to package.json!

3. LiveSvelte elements that use most Svelte Skeleton components must contain ssr={false}; otherwise, runtime errors will occur

4. Beware [Svelte-Kit $app dependencies](https://github.com/woutdp/live_svelte/discussions/30)!
  
## References

### Guides

1. [Install Phoenix](https://hexdocs.pm/phoenix/installation.html)
2. [Install Ash Authentication](https://hexdocs.pm/ash_authentication_phoenix/getting-started-with-ash-authentication-phoenix.html)
3. [Install Pyro](https://hexdocs.pm/pyro/get-started.html)
4. [Install Flowbite for Phoenix](https://flowbite.com/docs/getting-started/phoenix/)
5. [Install LiveSvelte](https://github.com/woutdp/live_svelte/blob/master/README.md)
6. [Install Skeleton for Svelte](https://www.skeleton.dev/docs/get-started)

### Other

- [Phoenix and Third-Party JS Packages](https://hexdocs.pm/phoenix/asset_management.html)
- [ElixirConf 2022 - Ryan Cooke - E2E Reactivity - using Svelte with Phoenix LiveView](https://www.youtube.com/watch?v=asm2TTm035o)
- [LiveSvelte video](https://www.youtube.com/watch?v=JMkvbW35QvA)
- [Getting Started: Phoenix 1.7 with Svelte](https://medium.com/@alistairisrael/phoenix-1-7-with-svelte-12257d853ed1)

## TODO

1. Sync styles between Svelte and Pyro components (if possible)
  - [see here](https://github.com/woutdp/live_svelte/discussions/28)
