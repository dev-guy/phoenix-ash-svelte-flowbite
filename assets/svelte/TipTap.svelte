<script>
import TaskItem from '@tiptap/extension-task-item'
import TaskList from '@tiptap/extension-task-list'

import StarterKit from "@tiptap/starter-kit";
import { Editor } from "@tiptap/core";
import { onMount } from "svelte";
import AppShell from './AppShell.svelte';

const CustomTaskItem = TaskItem.extend({
  content: 'inline*',
});

let element;
let editor;

onMount(() => {
  editor = new Editor({
    element: element,
    extensions: [
      StarterKit,
      TaskList,
      CustomTaskItem,
    ],

    content: `
      <ul data-type="taskList">
        <li data-type="taskItem" data-checked="true">flour</li>
        <li data-type="taskItem" data-checked="true">baking powder</li>
        <li data-type="taskItem" data-checked="true">salt</li>
        <li data-type="taskItem" data-checked="false">sugar</li>
        <li data-type="taskItem" data-checked="false">milk</li>
        <li data-type="taskItem" data-checked="false">eggs</li>
        <li data-type="taskItem" data-checked="false">butter</li>
      </ul>
      <p>Preheat the oven to 200°C/400°F/gas 6. Sift the flour, baking powder and salt into a bowl. Stir in the sugar. Make a well in the centre and pour in the milk, eggs and melted butter. Beat until smooth.</p>
      `,

    onTransaction: () => {
      // force re-render so `editor.isActive` works as expected
      editor = editor;
    },
  });
});
</script>

<!--
  :global prevents the Svelte esbuild plugin from removing these styles.
-->
<style lang='scss'>
  :global(ul[data-type="taskList"]) {
    list-style: none;
    padding: 0;

    :global(li) {
      display: flex;
      align-items: center;
      > :global(label) {
        flex: 0 0 auto;
        margin-right: 2rem;
        user-select: none;
      }

      > :global(div) {
        flex: 1 1 auto;
      }
    }
  }
</style>

<AppShell>

{#if editor}
<!-- See https://www.skeleton.dev/elements/buttons -->
    <div class="btn-group variant-filled tiptap-toolbar">
      <button
        on:click={() => editor.chain().focus().undo().run()}
        disabled={!editor.can().chain().focus().undo().run()}
      >
        undo
      </button>
      <button
        on:click={() => editor.chain().focus().redo().run()}
        disabled={!editor.can().chain().focus().redo().run()}
      >
        redo
      </button>
      <button
        on:click={() => console.log && editor.chain().focus().toggleBold().run()}
        disabled={!editor.can().chain().focus().toggleBold().run()}
        class={editor.isActive("bold") ? "is-active" : ""}
      >
        bold
      </button>
      <button
        on:click={() => editor.chain().focus().toggleItalic().run()}
        disabled={!editor.can().chain().focus().toggleItalic().run()}
        class={editor.isActive("italic") ? "is-active" : ""}
      >
        italic
      </button>
      <button
        on:click={() => editor.chain().focus().toggleStrike().run()}
        disabled={!editor.can().chain().focus().toggleStrike().run()}
        class={editor.isActive("strike") ? "is-active" : ""}
      >
        strike
      </button>
      <button
        on:click={() => editor.chain().focus().toggleHeading({ level: 1 }).run()}
        class={editor.isActive("heading", { level: 1 }) ? "is-active" : ""}
      >
        h1
      </button>
      <button
        on:click={() => editor.chain().focus().toggleHeading({ level: 2 }).run()}
        class={editor.isActive("heading", { level: 2 }) ? "is-active" : ""}
      >
        h2
      </button>
      <button
        on:click={() => editor.chain().focus().toggleHeading({ level: 3 }).run()}
        class={editor.isActive("heading", { level: 3 }) ? "is-active" : ""}
      >
        h3
      </button>
      <button
        on:click={() => editor.chain().focus().toggleCode().run()}
        disabled={!editor.can().chain().focus().toggleCode().run()}
        class={editor.isActive("code") ? "is-active" : ""}
      >
        code
      </button>
      <button
        on:click={() => editor.chain().focus().toggleCodeBlock().run()}
        class={editor.isActive("codeBlock") ? "is-active" : ""}
      >
        code block
      </button>
      <button
        on:click={() => editor.chain().focus().toggleBlockquote().run()}
        class={editor.isActive("blockquote") ? "is-active" : ""}
      >
        blockquote
      </button>
      <button on:click={() => editor.chain().focus().setHorizontalRule().run()}>
        horizontal rule
      </button>
    </div>
{/if}

<div bind:this={element} />

</AppShell>
