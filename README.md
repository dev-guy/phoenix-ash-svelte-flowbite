# Phoenix + Ash + Svelte + Flowbite Demo

<img alt='Phoenix' src="https://seeklogo.com/images/P/phoenix-logo-D15F067911-seeklogo.com.png" height=40 width=45><img alt='ash' align="top" src="https://ash-hq.org/images/ash-logo-side.svg" height=50 width=100><img alt='Tailwind CSS' src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/1200px-Tailwind_CSS_Logo.svg.png" height=45 width=45><img alt='Svelte' src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Svelte_Logo.svg" height=45 width=45><img alt='Flowbite' src="https://flowbite.com/docs/images/logo.svg" height=45 width=45><img alt='Flowbite-Svelte' src="https://flowbite-svelte.com/images/flowbite-svelte-icon-logo.svg" height=45 width=45>

## Introduction

A web browser application demonstrating:

- [x] [Phoenix](https://www.phoenixframework.org/) 1.7
- [x] [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html) 0.18
- [x] [Ash Framework](https://ash-hq.org) 2.6
- [x] [Ash Authentication](https://github.com/team-alembic/ash_authentication)
  - [x] Login page with users and passwords stored in Postgres without writing any imperative code
- [x] [Phlegethon](https://github.com/frankdugan3/phlegethon)
  - [x] Toggle dark and light themes
- [x] [Flowbite](https://flowbite.com) Tailwind CSS Components
  - [Flowbite Date Picker](https://flowbite.com/docs/plugins/datepicker/) on the home page
- [x] [Svelte](https://svelte.dev) via [LiveSvelte](https://wout.space/notes/live-svelte)
  - Svelte delivers many client-side UX niceties such as animations. Combining LiveView and Svelte is 10x!
  - Watch the [LiveSvelte video](https://www.youtube.com/watch?v=JMkvbW35QvA)
  - [x] The [LiveSvelte Counter](https://github.com/woutdp/live_svelte#create-a-svelte-component) page is similar to the [increment/decrement example](https://svelte.dev/repl/65fc4b475b884dcba414139848ff02ef). It communicates with the backend via Websockets.
  - [x] [TipTap Editor](https://tiptap.dev/) launched via Svelte
- [x] [Flowbite-Svelte](https://flowbite-svelte.com) examples on the Flowbite-Svelte Components page ("dead" view):
  - [Checkbox](https://flowbite-svelte.com/forms/checkbox)
  - [Accordion](https://flowbite-svelte.com/components/accordion)
  - [Sidebar Menu](https://flowbite-svelte.com/components/sidebar) with [Drawer](https://flowbite-svelte.com/components/drawer)

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
# Register the version of esbuild installed by npm
mix esbuild.install
mix phx.server
```

Open a browser to http://localhost:4000

## Notes

1. package.json contains JavaScript dependencies that are installed as Hex packages. This is apparently needed for Svelte SSR.

```js
    "live_svelte": "file:../deps/live_svelte",
    "phlegethon": "file:../deps/phlegethon",
    "phoenix": "file:../deps/phoenix",
    "phoenix_html": "file:../deps/phoenix_html",
    "phoenix_live_view": "file:../deps/phoenix_live_view"
```

2. Need another component? Add it to package.json!

3. LiveSvelte elements that use most Flowbite-Svelte components must contain ssr={false}; otherwise, runtime errors will occur

4. You will get warnings from Flowbite-Svelte that can be ignored (for now):

```
▲ [WARNING] A11y: The attribute 'aria-expanded' is not supported by the role 'heading'. This role is implicit on the element <h2>. [plugin esbuild-svelte]

    node_modules/flowbite-svelte/accordions/AccordionItem.svelte:43:4:
      43 │ 41: </script>
         ╵     ~~~~~~~~~

42:
43: <h2 aria-expanded={open} class="group">
        ^
```

5. Beware [Svelte-Kit $app dependencies](https://github.com/woutdp/live_svelte/discussions/30)!
  
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

## TODO

1. Upgrade flowbite-svelte - see [#647](https://github.com/themesberg/flowbite-svelte/issues/647)
1. Sync styles between Svelte and Phlegethon components - [see here](https://github.com/woutdp/live_svelte/discussions/28)
