// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
// @ts-check

const path = require('path')
const { skeleton } = require('@skeletonlabs/tw-plugin')

const plugin = require('tailwindcss/plugin')
const fs = require('fs')

/** @type {import('tailwindcss').Config} */
export default {
  darkMode: 'class',
  theme: {
		extend: {},
	},
  content: [
    './js/**/*.{js,ts}',
    './svelte/**/*.{html,js,svelte,ts}',
    './vendor/**/*.{js,ts}',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex',
    '../deps/ashauthentication_phoenix/**/*.ex',
    '../deps/pyro/lib/pyro/**/*.*ex',
    './node_modules/flowbite/**/*.{js,ts}',
    './node_modules/@skeletonlabs/skeleton/**/*.{html,js,svelte,ts}',
	],
  plugins: [
    require('tailwind-scrollbar-hide'),
    // require('@tailwindcss/forms'),

    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class='phx-click-loading:animate-ping'>
    //
    plugin(({addVariant}) => addVariant('phx-no-feedback', ['.phx-no-feedback&', '.phx-no-feedback &'])),
    plugin(({addVariant}) => addVariant('phx-click-loading', ['.phx-click-loading&', '.phx-click-loading &'])),
    plugin(({addVariant}) => addVariant('phx-submit-loading', ['.phx-submit-loading&', '.phx-submit-loading &'])),
    plugin(({addVariant}) => addVariant('phx-change-loading', ['.phx-change-loading&', '.phx-change-loading &'])),

    // Embeds Hero Icons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, './vendor/heroicons/optimized')
      let values = {}
      let icons = [
        ['', '/24/outline'],
        ['-solid', '/24/solid'],
        ['-mini', '/20/solid']
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).map(file => {
          let name = path.basename(file, '.svg') + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        'hero': ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, '')
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            '-webkit-mask': `var(--hero-${name})`,
            'mask': `var(--hero-${name})`,
            'background-color': 'currentColor',
            'vertical-align': 'middle',
            'display': 'inline-block',
            'width': theme('spacing.5'),
            'height': theme('spacing.5')
          }
        }
      }, {values})
    }),

    // Pyro
    plugin(({ addVariant }) => addVariant('aria-selected', '&[aria-selected]')),
    plugin(({ addVariant }) => addVariant('aria-checked', '&[aria-checked]')),

    // Without this, tooltip arrows don't display. See the tooltip on the login button in the page
    // header (next to the light/dark mode buttons).
    require('flowbite/plugin'),

    // Svelte Skeleton theme
    skeleton({
      themes: {
        // Register each theme within this array:
        preset: [ { name: 'skeleton', enhancements: true }, 'modern', 'crimson' ]
      }
    }),
  ]
}
