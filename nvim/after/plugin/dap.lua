local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/user/ssunsnjar/local/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

-- local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    miDebuggerPath = '/home/user/ssunsnjar/local/rh/devtoolset-9/root/bin/gdb',
    stopAtEntry = true,
    setupCommands = {
        {
            text = '-enable-pretty-printing',
            description =  'enable pretty printing',
            ignoreFailures = false
        },
    },
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/home/user/ssunsnjar/local/rh/devtoolset-9/root/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
  {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type = 'cpp',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
      request = 'attach',
      pid = require('dap.utils').pick_process,
      args = {},
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("dapui").setup()

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_initialized["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


