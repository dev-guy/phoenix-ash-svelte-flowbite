// placeholder plugin for the milkdown editor.
// Copyright (c) Lactose 2023
// Milkdown is made by Mirone. https://milkdown.dev

import { Plugin, PluginKey } from '@milkdown/prose/state';
import { DecorationSet } from '@milkdown/prose/view';
import { $prose } from '@milkdown/utils';
import Hashes from '../svelte/milkdown/Hashes.svelte';

const plugin = (widgetViewFactory) => new Plugin({
    key: new PluginKey('milkdown-hashes'),
    props: {
        decorations: (state) => {
          const getHashWidget = widgetViewFactory({
            component: Hashes,
            as: 'i',
          });
          console.log('create decorations')
          const { $from } = state.selection;
          const node = $from.node();
          if (node.type.name !== 'heading')
            return DecorationSet.empty

          const widget = getHashWidget($from.before() + 1, {
            side: -1,
            level: node.attrs.level,
          })

          return DecorationSet.create(state.doc, [widget])
        }
    }
});
export const useHashesPlugin = (widgetViewFactory) => $prose(() => plugin(widgetViewFactory));
