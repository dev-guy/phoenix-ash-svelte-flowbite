import { Plugin, PluginKey } from '@milkdown/prose/state';
import { Decoration, DecorationSet } from '@milkdown/prose/view';
import { $prose } from '@milkdown/utils';

/**
 * @module
 * Milkdown plugin that adds placeholder text to an empty editor
 *
 * Credits
 *
 * Milkdown Discord by @syntaxbullet
 * https://discord.com/channels/870181036041060352/1104785346710994955/1106921721484804176
 */

// Only one instance of this plugin is needed
const plugin = new Plugin({
  key: new PluginKey('milkdown-placeholder'),
  props: {
    decorations: (state) => {
      const element = document.createElement('span');

      element.classList.add('milkdown-placeholder');
      element.style.position = 'absolute';
      element.style['font-style'] = 'italic';
      element.innerText = 'This is the secret message'

      const placeholderDecoration = Decoration.widget(0, element, {
        key: 'milkdown-placeholder',
        side: 0
      });
      if (
        state.doc.textContent.trim().length === 0 &&
        state.doc.firstChild?.type.name === 'paragraph'
      ) {
        return DecorationSet.create(state.doc, [placeholderDecoration]);
      } else {
        return DecorationSet.empty;
      }
    }
  }
});

export const empty = $prose(() => plugin);
