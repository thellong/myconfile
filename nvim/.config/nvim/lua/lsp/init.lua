local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

require("lsp.icons").setup()

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

vim.cmd [[ autocmd! CursorHold,CursorHoldI * lua require('lsp.code_action_utils').code_action_listener() ]]

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- 2. (optional) Override the default configuration to be applied to all servers.
lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        on_attach = on_attach
    }
)

-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {}
  if server.name == "sumneko_lua" then
    require("lsp.servers.sumneko_lua")
  end
end
