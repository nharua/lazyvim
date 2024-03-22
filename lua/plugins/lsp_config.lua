return {
  { -- Install/Manage LSP servers, DAP servers, linters and formatters.
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  { -- mason-lspconfig briges mason.vim with the lspconfig
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" }
      })
    end
  },
  {
    -- help communicate between nvim and language servers
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {}
      lspconfig.pyright.setup {}
      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear=true }),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc})
          end
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        end,
      })
    end
  },
}
