local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
            gofumpt = true,
            staticcheck = true,
        },
    },
})

local function organize_imports()
    local params = {
      command = "_typescript.organizeImports",
      arguments = {vim.api.nvim_buf_get_name(0)},
    }
    vim.lsp.buf.execute_command(params)
end

lspconfig.templ.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "templ" },
})

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
            plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/home/gabriel/.asdf/installs/nodejs/20.13.1/lib/node_modules/@vue/typescript-plugin/",
        languages = {"javascript", "typescript", "vue"},
      },
    },
    },
    commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        }
    },
        filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vue',
  },
}

lspconfig.intelephense.setup({
    on_attach = on_attach,
	capabilities = capabilities,
})


lspconfig.volar.setup({
    on_attach = on_attach,
    capabilities = capabilities,
      filetypes = { 'vue' },
  settings = {
    vue = {
      complete = {
        casing = {
          props = 'autoCamel',
        },
      },
    },
  },
})

lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})

lspconfig.htmx.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})

lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "templ", "astro", "javascript", "typescript", "react" },
    init_options = { userLanguages = { templ = "html" } },
})
