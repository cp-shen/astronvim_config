local M = {}

function M.setup_rt(server_opts)
  local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb/'
  local codelldb_path = extension_path .. 'adapter/codelldb'
  local liblldb_path = extension_path .. 'lldb/lib/liblldb'
  local this_os = vim.loop.os_uname().sysname;

  if this_os:find "Windows" then
    -- codelldb_path = package_path .. "adapter\\codelldb.exe"
    -- liblldb_path = package_path .. "lldb\\bin\\liblldb.dll"
  else
    -- The liblldb extension is .so for linux and .dylib for macOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

  local opts = {
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path)
    },
    server = server_opts
  }

  require('rust-tools').setup(opts)
end

return M
