local function scala_setup()
  local api = vim.api
  local map = vim.keymap.set
  local metals_config = require("metals").bare_config()

  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
  metals_config.init_options.statusBarProvider = "on"
  metals_config.settings = {
    showImplicitConversionsAndClasses = true,
    showImplicitArguments = true,
    useGlobalExecutable = true,
    -- testUserInterface = "Test Explorer",
    scalafmtConfigPath = vim.env["HOME"] .. "/.config/scalafmt/scalafmt.conf"
  }


  local dap = require("dap")

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run or Test File",
      metals = {
        runType = "runOrTestFile",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }

  ---@diagnostic disable-next-line: unused-local
  metals_config.on_attach = function(client, bufnr)
    require("metals").setup_dap()
  end

  map("n", "gd", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "gr", vim.lsp.buf.references)

  local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
  api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })
end

return {
  {
    'scalameta/nvim-metals',
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "scala",
    config = scala_setup
  }
}
