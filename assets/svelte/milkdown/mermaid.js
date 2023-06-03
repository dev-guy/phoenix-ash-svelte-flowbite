import { diagram, diagramSchema } from "@milkdown/plugin-diagram";
import { $view } from '@milkdown/utils';
import Mermaid from './Mermaid.svelte';

/**
 * @module
 */

// Multiple instances of this plugin are needed because it is Svelte context-dependent
export function mermaid({nodeViewFactory}) {
  return [diagram, $view(diagramSchema.node, () =>
    nodeViewFactory({
      component: Mermaid,
      stopEvent: ()=>true,
    }))];
}
