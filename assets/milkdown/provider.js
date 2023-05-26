import {
  useProsemirrorAdapterProvider,
  useWidgetViewFactory,
} from "@prosemirror-adapter/svelte";

/**
 * Initializes Milkdown for the Svelte context. Must be called only once before using Milkdown.
 * @returns {object}
 */
function useProvider() {
  useProsemirrorAdapterProvider();
  const widgetViewFactory = useWidgetViewFactory();
  return { widgetViewFactory };
}

export { useProvider };
