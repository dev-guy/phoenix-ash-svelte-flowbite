import { Plugin, PluginKey } from '@milkdown/prose/state';
import { DecorationSet } from '@milkdown/prose/view';
import { $prose } from '@milkdown/utils';

import Hashes from './Hashes.svelte';

/**
 * @module
 * Milkdown plugin that visualizes headings with a variable number of # signs
 *
 * Usage:
 *
 * import { useProvider } from './milkdown/provider';
 * import { headingHashes } from './milkdown/heading-hashes';
 * ...
 * const provider = useProvider();
 * ...
 * Editor.make()
 *   ...
 *   use: headingHashes(provider);
 */

// Multiple instances of this plugin are needed because it is Svelte context-dependent
export function headingHashes({widgetViewFactory}) {
  const widgetFactory = widgetViewFactory({
    component: Hashes,
    as: 'i',
  });
  return $prose(() => {
    return new Plugin({
      key: new PluginKey('milkdown-hashes'),
      props: {
        decorations: (state) => {
          const { $from } = state.selection;
          const node = $from.node();

          if (node.type.name !== 'heading') return DecorationSet.empty;

          const widget = widgetFactory($from.before() + 1, {
            side: -1,
            level: node.attrs.level,
          });

          return DecorationSet.create(state.doc, [widget])
        }
      }
    });
  });
}
