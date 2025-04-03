require("mason").setup({
  ui = {
    icons = {
      package_installed = "✔️",
      package_pending = "⏳",
      package_uninstalled = "❌"
    }
  }
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "c", "cpp", "cuda", "rust", "javascript", "vim", "verilog", "bash", "markdown" , "zig" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

require('telescope').setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.45
      },
      vertical = {
        mirror = false,
        width = 0.8,
        height = 0.9,
        preview_height = 0.4
      },
      center = {
        width = 0.5,
      },
      bottom_pane = {
        height = 0.4,
        prompt_position = "top",
      },
    },
    sorting_strategy = "ascending",
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
    winblend = 0,
  },
})

require("lualine").setup({
  options = {
    theme = "auto",
    icons_enabled = false,
    section_separators = { left = "", right = "" },
    component_separators = { left = "/", right = "/" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
})

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' }
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local lspconfig = require("lspconfig")

lspconfig.emmet_ls.setup({
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true
      }
    }
  }
})

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end, opts)
end

local servers = { "clangd", "pyright", "rust_analyzer", "lua_ls", "ts_ls", "bashls", "zls" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  })
end

cmp.setup({
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' }
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
