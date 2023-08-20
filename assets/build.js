const esbuild = require("esbuild")
const sveltePlugin = require("esbuild-svelte")
const importGlobPlugin = require("esbuild-plugin-import-glob").default
const sveltePreprocess = require("svelte-preprocess")
const purgecssPlugin2 = require('esbuild-plugin-purgecss-2')
// const glob = require('glob-all')

const args = process.argv.slice(2)
const watch = args.includes("--watch")
const deploy = args.includes("--deploy")

let optsClient = {
    entryPoints: ["js/app.js"],
    bundle: true,
    metafile: true,
    minify: deploy,
    target: "es2017",
    conditions: ["svelte", "browser"],
    outdir: "../priv/static/assets",
    logLevel: "info",
    sourcemap: watch ? "inline" : false,
    tsconfig: "./tsconfig.json",
    plugins: [
        importGlobPlugin(),
        sveltePlugin({
            preprocess: sveltePreprocess(),
            compilerOptions: {dev: !deploy, hydratable: true, css: "injected"},
        }),
        purgecssPlugin2({
          // content: glob.sync([
              // Customize the following URLs to match your setup
          //    './*.html',
          //     './views/**/*.html'
          //]),
      }),
    ],
}

let optsServer = {
    entryPoints: ["js/server.js"],
    platform: "node",
    metafile: true,
    bundle: true,
    minify: false,
    target: "node20",
    conditions: ["svelte"],
    outdir: "../priv/svelte",
    logLevel: "info",
    sourcemap: watch ? "inline" : false,
    tsconfig: "./tsconfig.json",
    plugins: [
        importGlobPlugin(),
        sveltePlugin({
            preprocess: sveltePreprocess(),
            compilerOptions: {dev: !deploy, hydratable: true, generate: "ssr"},
        }),
    ],
}

const client = esbuild.context(optsClient).then(context => {
    if (watch) context.watch()
    else context.dispose()
})

const server = esbuild.context(optsServer).then(context => {
    if (watch) context.watch()
    else context.dispose()
})

if (watch) {
    client.then(_result => {
        process.stdin.on("close", () => process.exit(0))
        process.stdin.resume()
    })

    server.then(_result => {
        process.stdin.on("close", () => process.exit(0))
        process.stdin.resume()
   })
}
