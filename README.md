# Phoenix Ash Tailwind Svelte Yjs Flowbite Skeleton TipTap Milkdown Mermaid Mash-Up

<img alt='Phoenix' src="https://seeklogo.com/images/P/phoenix-logo-D15F067911-seeklogo.com.png" height=40 width=45><img alt='ash' align="top" src="https://ash-hq.org/images/ash-logo-side.svg" height=50 width=100><img alt='Tailwind CSS' src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/1200px-Tailwind_CSS_Logo.svg.png" height=45 width=45><img alt='Flowbite' src="https://flowbite.com/docs/images/logo.svg" height=45 width=45><img alt='Svelte' src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Svelte_Logo.svg" height=45 width=45><img alt='Yjs' height=45 width=45 src="https://yjs.dev/images/logo/yjs.svg"><img alt='Skeleton' height=45 width=45 src="https://pbs.twimg.com/profile_images/1587479781544759297/TINbbJLC_400x400.png"><img height=45 width=45 alt="TipTap" src="https://camo.githubusercontent.com/a1e57801dcd479596fc7fac670540acda3edc1b07d1820ec4315361eba95f310/68747470733a2f2f756e6176617461722e696f2f6769746875622f7565626572646f736973"><img height=45 width=45 alt="Milkdown" src="https://milkdown.dev/milkdown-logo.svg"><img height=45 width=45 alt="Mermaid"
src="https://www.mermaidchart.com/img/icon-logo.svg">

## Previous Versions

- [April 2023: With Flowbite-Svelte](https://github.com/dev-guy/ash-svelte-flowbite/tree/flowbite-svelte)

## Video

[May 26 2023](https://github.com/dev-guy/phoenix-ash-svelte-flowbite/assets/12297328/db502e70-e96b-48ee-8eea-7c382784ade3)

## Introduction

This is a web browser application demonstrating:

- [x] [Phoenix 1.7](https://www.phoenixframework.org/)
- [x] [pnpm](https://pnpm.io/) Replaces npm because it's faster
- [x] [esbuild 0.19](https://github.com/phoenixframework/esbuild)
- [x] [TailwindCSS 3.3](https://tailwindcss.com)
- [x] [Phoenix LiveView 0.18](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html)
- [x] [Ash Framework 2.9](https://ash-hq.org)
  - [x] [Ash Authentication](https://github.com/team-alembic/ash_authentication)
- [x] [Pyro](https://hexdocs.pm/pyro/about.html)
  - [x] Toggle dark and light themes using Pyro
  - [x] Custom Pyro overrides to match Svelte Skeleton (partially implemented)
- [x] [Flowbite 1.8](https://flowbite.com) Tailwind CSS Components
  - [x] [Application Shell](https://flowbite.com/blocks/application/shells) with header and responsive left sidebar
  - [x] [Date Picker](https://flowbite.com/docs/plugins/datepicker/) on the home page
  - [x] [Menu](https://flowbite.com/docs/components/navbar/#navbar-with-dropdown)
  - [x] [Tooltips](https://flowbite.com/docs/components/tooltips)
    - <img width="100" height="100" alt="Flowbite Tooltip for the login button" src="https://github.com/dev-guy/phoenix-ash-svelte-flowbite/assets/12297328/e2bb2e5f-f653-4271-83e8-6c5c2d6e3209">
- [x] [Svelte 4](https://svelte.dev) via [LiveSvelte 0.11](https://wout.space/notes/live-svelte)
  - [x] Support Sass/Scss/PostCSS
  - [x] CRDT counter with [Yjs](https://yjs.dev)
  - [x] [LiveSvelte Counter](https://github.com/woutdp/live_svelte#create-a-svelte-component) is similar to the [increment/decrement example](https://svelte.dev/repl/65fc4b475b884dcba414139848ff02ef). It communicates with the backend via Websockets. Uses the convenient ~V sigil.
  - [x] [Mermaid diagram editor](https://terrislinenbach.medium.com/dynamically-render-a-mermaid-diagram-with-sveltekit-and-very-little-code-d8130875cd68) in a .svelte file (dead view)
  - [x] [TipTap 2.1](https://tiptap.dev/) (dead view) with task list plugin
  - [x] [Milkdown 7.2](https://milkdown.dev) (dead view) with Markdown, Mermaid, and collaboration via [Yjs](https://yjs.dev)
  - [x] [Kanban board](https://www.npmjs.com/package/svelte-kanban) (dead view)
- [x] [Svelte Skeleton 2](https://www.skeleton.dev/)
  - [x] Theme and styles provided by Skeleton
  - [x] [Tabs](https://www.skeleton.dev/components/tabs)
  - [x] [Accordion](https://www.skeleton.dev/components/accordions) (dead view)
  - [x] [Toast](https://www.skeleton.dev/utilities/toasts) (dead view)
- [x] Replace Cowboy with [Bandit 1.0](https://hexdocs.pm/bandit/1.0.0-pre.13/Bandit.html)

## License

[MIT](LICENSE)

## Help and additional information

Join the [Ash Discord Server](https://discord.com/invite/D7FNG2q) and check out the Pyro channel.


## Requirements

### Postgres

[Install Postgres](https://www.postgresql.org/docs/current/tutorial-install.html)

### nvm

- [Install nvm](https://github.com/nvm-sh/nvm/blob/master/README.md#install--update-script)
- Restart your terminal

### Elixir

Restart your terminal after installing Elixir.

#### Installing stable Elixir on MacOS

- [Install Homebrew](https://docs.brew.sh/Installation)
- Restart your terminal
- `brew install elixir`

#### Installing bleeding-edge Elixir on MacOS with asdf

This might work better with VSCode language servers for Elixir. Or it might not work at all.

This currently fails to build `erlang-ssl-fun`.

```sh
brew install autoconf wxwidgets libxslt fop openssl@1.1 asdf
# I use zsh. Change the following line to >> ~/.bashrc if you use bash.
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
# Restart your terminal
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
# To install more docs, add the following at the beginning:
# KERL_INSTALL_MANPAGES=yes KERL_INSTALL_HTMLDOCS=yes
KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac --with-ssl=$(brew --prefix openssl@1.1)" KERL_BUILD_DOCS=yes asdf install erlang 26.0.1
asdf global erlang 26.0.1
asdf plugin add elixir
asdf install elixir 1.15.0
asdf global elixir 1.15.0
```

### Rust (for Rustler) - not yet needed

See https://www.rust-lang.org/tools/install

## Visual Studio Code Configuration

### Tailwind CSS Intellisence

[vscode-tailwindcss](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)

```js
  "tailwindCSS.experimental.configFile": "./assets/tailwind.config.js"
```

## Usage

```sh
git clone https://github.com/dev-guy/phoenix-ash-svelte-flowbite.git
cd phoenix-ash-svelte-flowbite
nvm install
npm install -g @pnpm/exe
mix local.hex
mix local.rebar
mix tailwind.install
mix setup
# Register the version of esbuild installed by pnpm
mix esbuild.install
mix phx.server
```

Open a browser to http://localhost:4000

## Notes

- Svelte Skeleton
  - [Svelte Skeleton](https://www.skeleton.dev) implements styles and themes that can also be used with Phoenix comonents
  - The theme is specified in `assets/tailwind.config.js`. It is also specified in `root.html.heex` via `data-theme=`
  - Skeleton's surface, primary, secondary, tertiary, success, warning, and error colors were incorporated with Pyro's components for a consistent look across Pyro and Skeleton components
- LiveSvelte
  - Svelte delivers many client-side UX niceties such as animations. Combining LiveView and Svelte is 10x!
  - [LiveSvelte video](https://www.youtube.com/watch?v=JMkvbW35QvA)
  - Need another Svelte or JavaScript component? Just add it to package.json!
  - `.svelte` files are located in assets/svelte
  - `<style>` elements that need Postcss etc. should use `lang="scss"` instead of `type="text/scss"`
  - SSR has been disabled temporarily because there are too many crashes
    - LiveSvelte elements that use most Svelte Skeleton components must specify ssr={false}
  - Using @apply in `<style>` blocks in Svelte files is [a bad idea](https://tailwindcss.com/docs/functions-and-directives#using-apply-with-per-component-css)
  - Beware [Svelte-Kit $app dependencies](https://github.com/woutdp/live_svelte/discussions/30)!
  - Until editors understand that ~V is for Svelte, using .svelte files will have a better DX. Plus ~V doesn't work with dead views.
  - package.json contains JavaScript dependencies that are installed as Hex packages. This is apparently needed for SSR.

```js
    "live_svelte": "file:../deps/live_svelte",
    "pyro": "file:../deps/pyro",
    "phoenix": "file:../deps/phoenix",
    "phoenix_html": "file:../deps/phoenix_html",
    "phoenix_live_view": "file:../deps/phoenix_live_view"
```

## References

### Guides

1. [Install Phoenix](https://hexdocs.pm/phoenix/installation.html)
2. [Install Ash Authentication](https://hexdocs.pm/ash_authentication_phoenix/getting-started-with-ash-authentication-phoenix.html)
3. [Install Pyro](https://hexdocs.pm/pyro/get-started.html)
4. [Install Flowbite for Phoenix](https://flowbite.com/docs/getting-started/phoenix/)
5. [Install LiveSvelte](https://github.com/woutdp/live_svelte/blob/master/README.md)
6. [Install Svelte Skeleton](https://www.skeleton.dev/docs/get-started)
  - [Skeleton 2 migration guide](https://github.com/skeletonlabs/skeleton/discussions/1854)
  - Include [PurgeCSS](https://skeleton-docs-git-v2-skeleton-labs.vercel.app/docs/purgecss)
  - Read about [Flowbite and Skeleton](https://www.skeleton.dev/blog/skeleton-plus-flowbite)
7. [Install Tailwind Scrollbar Hide Plugin](https://github.com/reslear/tailwind-scrollbar-hide)
8. [LiveView feels faster with a delayed loading indicator](https://fly.io/phoenix-files/make-your-liveview-feel-faster/)

### Upgrading npm packages

1. esbuild: modify config.exs
2. tailwindcss: modify config.exs
3. node (see .nvmrc): build.js (see target:)

### Other

- [Why all JS dependencies are devDependencies](https://github.com/sveltejs/sapper-template#using-external-components)
- [Phoenix and Third-Party JS Packages](https://hexdocs.pm/phoenix/asset_management.html)
- [ElixirConf 2022 - Ryan Cooke - E2E Reactivity - using Svelte with Phoenix LiveView](https://www.youtube.com/watch?v=asm2TTm035o)
- [Getting Started: Phoenix 1.7 with Svelte](https://medium.com/@alistairisrael/phoenix-1-7-with-svelte-12257d853ed1)

## Milkdown Collaborative Editing

Tabbed collaboration works out of the box. Cross-browser collaboration requires running a WebRTC server:

```sh
nvm i
cd assets
PORT=4444 npx y-webrtc server.js
```

## TODO

1. Sync styles between Svelte and Pyro components - [details](https://github.com/woutdp/live_svelte/discussions/28)

## Credits

1. [Prosemirror-adapter Svelte Example](https://stackblitz.com/edit/github-w7hjxh?file=README.md)
