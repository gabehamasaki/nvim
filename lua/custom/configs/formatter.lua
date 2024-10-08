local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    astro = {
      function()
        return {
          exe = "prettier",
          args = { "--write" },
        }
      end,
    },
    go = {
      function()
        return {
          exe = "gofumpt",
          args = { "-l", "-w" },
        }
      end,
      function()
        return {
          exe = "golines",
          args = { "-w", "-m 80" },
        }
      end,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
    templ = {
      function()
        return {
          exe = "templ fmt",
        }
      end,
    },
  },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock",
})

return M
