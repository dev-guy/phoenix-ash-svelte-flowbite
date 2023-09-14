import { syncedStore, getYjsDoc } from "@syncedstore/core";
import { WebrtcProvider } from "y-webrtc";
import { svelteSyncedStore } from "@syncedstore/svelte";

// Create your SyncedStore store
export const store = syncedStore({ todos: [] });
export const svelteStore = svelteSyncedStore(store);

// Create a document that syncs automatically using Y-WebRTC
const doc = getYjsDoc(store);
export const webrtcProvider = new WebrtcProvider("syncedstore-todos", doc);
