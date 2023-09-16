require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = { os.getenv "HOME" .. "/nvim-dap/js-debug/src/dapDebugServer.js", "${port}" },
  },
}

require("dap").adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/nvim-dap/vscode-node-debug2/out/src/nodeDebug.js'},
}
