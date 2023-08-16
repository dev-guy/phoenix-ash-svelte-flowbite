<script>
  import { AppShell, Accordion, AccordionItem, TabGroup, Tab } from "@skeletonlabs/skeleton";
  import { initializeStores, getToastStore } from '@skeletonlabs/skeleton';
  import mermaid from "mermaid";
  import { Toast } from '@skeletonlabs/skeleton';


  export let toastName;
  let tabSet = 0;
  let diagramContainer;

  let diagram = `\
  pie title Pets adopted by volunteers
    "Dogs" : 386
    "Cats" : 85
    "Rats" : 15
  `;

  async function renderDiagram() {
    const { svg } = await mermaid.render("mermaid", diagram);
    diagramContainer.innerHTML = svg;
  }

  initializeStores();
  const toastStore = getToastStore();

  $: tabSet === 1 && diagram && renderDiagram();

function addToast() {
  const t = {
  message: 'Why is this purple?',
  autohide: true
  };
  toastStore.trigger(t);
}
</script>

<Toast/>

<h1 class='h1'>Tab Group + Mermaid</h1>

<TabGroup>
	<Tab bind:group={tabSet} name="tab1" value={0}>Code</Tab>
	<Tab bind:group={tabSet} name="tab2" value={1}>Diagram</Tab>
	<!-- Tab Panels --->
	<svelte:fragment slot="panel">
		{#if tabSet === 0}
      <pre contenteditable="true" bind:innerHTML={diagram} />
		{:else if tabSet === 1}
      <span bind:this={diagramContainer} />
    {/if}
	</svelte:fragment>
</TabGroup>

<h1 class='h1'>Accordion</h1>

<AppShell>
	<!-- (header) -->
	<svelte:fragment slot="sidebarLeft">Sidebar Left</svelte:fragment>
	<!-- (sidebarRight) -->
	<svelte:fragment slot="pageHeader">Page Header</svelte:fragment>
	<!-- (pageFooter) -->
	<svelte:fragment slot="footer">Footer</svelte:fragment>
<Accordion>
  <AccordionItem open>
    <svelte:fragment slot="lead">
      <i class="fa-solid fa-book text-xl w-6 text-center">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-6 h-6"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5"
          />
        </svg>
      </i></svelte:fragment
    >
    <svelte:fragment slot="summary"
      ><p class="font-bold">Timeline</p></svelte:fragment>
    <svelte:fragment slot="content">
      <!-- This is the timeline -->
<ol class="relative border-l border-gray-200 dark:border-gray-700">
  <li class="mb-10 ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >February 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      Application UI code in Tailwind CSS
    </h3>
    <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
      Get access to over 20+ pages including a dashboard layout, charts, kanban
      board, calendar, and pre-order E-commerce & Marketing pages.
    </p>
    <a
      href="/"
      class="inline-flex items-center px-4 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:outline-none focus:ring-gray-200 focus:text-blue-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700 dark:focus:ring-gray-700"
      >Learn more <svg
        class="w-3 h-3 ml-2"
        fill="currentColor"
        viewBox="0 0 20 20"
        xmlns="http://www.w3.org/2000/svg"
        ><path
          fill-rule="evenodd"
          d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
          clip-rule="evenodd"
        /></svg
      ></a
    >
  </li>
  <li class="mb-10 ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >March 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      Marketing UI design in Figma
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      All of the pages and components are first designed in Figma and we keep a
      parity between the two versions even as we update the project.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
  <li class="ml-4">
    <div
      class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"
    />
    <time
      class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"
      >April 2022</time
    >
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      E-Commerce UI code in Tailwind CSS
    </h3>
    <p class="text-base font-normal text-gray-500 dark:text-gray-400">
      Get started with dozens of web components and interactive elements built
      on top of Tailwind CSS.
    </p>
  </li>
</ol>
    </svelte:fragment>
  </AccordionItem>
</Accordion>
</AppShell>

<h1 class='h1'>Slotted Flowbite Toast</h1>

<div
  id="toast-default"
  class="flex items-center w-full max-w-xs p-4 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800"
  role="alert"
>
  <div
    class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-blue-500 bg-blue-100 rounded-lg dark:bg-blue-800 dark:text-blue-200"
  >
    <svg
      aria-hidden="true"
      class="w-5 h-5"
      fill="currentColor"
      viewBox="0 0 20 20"
      xmlns="http://www.w3.org/2000/svg"
      ><path
        fill-rule="evenodd"
        d="M12.395 2.553a1 1 0 00-1.45-.385c-.345.23-.614.558-.822.88-.214.33-.403.713-.57 1.116-.334.804-.614 1.768-.84 2.734a31.365 31.365 0 00-.613 3.58 2.64 2.64 0 01-.945-1.067c-.328-.68-.398-1.534-.398-2.654A1 1 0 005.05 6.05 6.981 6.981 0 003 11a7 7 0 1011.95-4.95c-.592-.591-.98-.985-1.348-1.467-.363-.476-.724-1.063-1.207-2.03zM12.12 15.12A3 3 0 017 13s.879.5 2.5.5c0-1 .5-4 1.25-4.5.5 1 .786 1.293 1.371 1.879A2.99 2.99 0 0113 13a2.99 2.99 0 01-.879 2.121z"
        clip-rule="evenodd"
      /></svg
    >
    <span class="sr-only">Fire icon</span>
  </div>
  <slot name="toast">
    <h2 class="h5">No toast</h2>
  </slot>
  <button
    type="button"
    class="ml-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700"
    data-dismiss-target="#toast-default"
    aria-label="Close"
  >
    <span class="sr-only">Close</span>
    <svg
      aria-hidden="true"
      class="w-5 h-5"
      fill="currentColor"
      viewBox="0 0 20 20"
      xmlns="http://www.w3.org/2000/svg"
      ><path
        fill-rule="evenodd"
        d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
        clip-rule="evenodd"
      /></svg
    >
  </button>
</div>


<h1 class='h1'>Skeleton Toast - {toastName}</h1>
<button class='btn btn-sm variant-filled-warning' on:click={addToast}>Toast?</button>
