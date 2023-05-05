return {
  formatting = {
    -- control auto formatting on save
    format_on_save = {
      enabled = false,      -- enable or disable format on save globally
      allow_filetypes = {   -- enable format on save for specified filetypes only
        -- "go",
      },
      ignore_filetypes = {   -- disable format on save for specified filetypes
        -- "python",
      },
    },
    disabled = {   -- disable formatting capabilities for the listed language servers
      -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
      -- "lua_ls",
    },
    timeout_ms = 1000,   -- default format timeout
    -- filter = function(client) -- fully override the default formatting function
    --   return true
    -- end
  },
  -- enable servers that you already have installed without mason
  servers = {
    "lua_ls", "rust_analyzer"
  },
  setup_handlers = {
    rust_analyzer = function (_, opts)
      require("user.lsp-rust").setup_rt(opts)
    end,
  },
  config = {
    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    },
  }
}
