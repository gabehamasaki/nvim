# Hamasaki's Nvim configuration


## Snippets

### Vue support

As of 2.0.0, Volar no longer supports TypeScript itself. Instead, a plugin
adds Vue support to this language server.

*IMPORTANT*: It is crucial to ensure that `@vue/typescript-plugin` and `volar `are of identical versions.

```lua
require'lspconfig'.tsserver.setup{
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

-- You must make sure volar is setup
-- e.g. require'lspconfig'.volar.setup{}
-- See volar's section for more information
```
