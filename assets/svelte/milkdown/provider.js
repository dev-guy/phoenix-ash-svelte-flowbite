import {
  useProsemirrorAdapterProvider,
  useNodeViewFactory,
  usePluginViewFactory,
  useWidgetViewFactory,
} from "@prosemirror-adapter/svelte";

/**
 * Initializes Milkdown for the Svelte context. Must be called only once before using Milkdown.
 * @returns {object}
 */
function useProvider() {
  useProsemirrorAdapterProvider();
  const nodeViewFactory = useNodeViewFactory();
  const pluginViewFactory = usePluginViewFactory();
  const widgetViewFactory = useWidgetViewFactory();
  return { nodeViewFactory, pluginViewFactory, widgetViewFactory };
}

export { useProvider };
