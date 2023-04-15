const esbuild = require("esbuild")
const sveltePlugin = require("esbuild-svelte")
const importGlobPlugin = require("esbuild-plugin-import-glob").default
const sveltePreprocess = require("svelte-preprocess")
const tailwind = require('tailwindcss')
const autoprefixer = require('autoprefixer')

const args = process.argv.slice(2)
const watch = args.includes("--watch")
const deploy = args.includes("--deploy")

let optsClient = {
    entryPoints: ["js/app.js"],
    mainFields: ["svelte", "browser", "module", "main"],
    bundle: true,
    minify: false,
    target: "es2017",
    outdir: "../priv/static/assets",
    logLevel: "info",
    plugins: [
        importGlobPlugin(),
        sveltePlugin({
            preprocess: sveltePreprocess({
                postcss: {
                    plugins: [
                        tailwind, 
                        autoprefixer
                    ]
                }
            }),
            compilerOptions: {hydratable: true, css: true},
        }),
    ],
}

let optsServer = {
    entryPoints: ["js/server.js"],
    mainFields: ["svelte", "module", "main"],
    platform: "node",
    format: "cjs",
    bundle: true,
    minify: false,
    target: "node19.6.1",
    outdir: "../priv/static/assets/server",
    logLevel: "info",
    plugins: [
        importGlobPlugin(),
        sveltePlugin({
            preprocess: sveltePreprocess(),
            compilerOptions: {hydratable: true, generate: "ssr", format: "cjs"},
        }),
    ],
}

if (watch) {
    optsClient = {
        ...optsClient,
        sourcemap: "inline",
    }

    optsServer = {
        ...optsServer,
        sourcemap: "inline",
    }
}

if (deploy) {
    optsClient = {
        ...optsClient,
        minify: true,
    }
}

const client = esbuild.context(optsClient).then(context => {
    if (watch) {
        context.watch()
    }
})

const server = esbuild.context(optsServer).then(context => {
    if (watch) {
        context.watch()
    }
})

if (watch) {
    client.then(_result => {
        process.stdin.on("close", () => {
            process.exit(0)
        })

        process.stdin.resume()
    })

    server.then(_result => {
        process.stdin.on("close", () => {
            process.exit(0)
        })

        process.stdin.resume()
    })
}
