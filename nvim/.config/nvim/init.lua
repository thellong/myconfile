-- Ola
--[[

  __  .__           .__  .__                 
_/  |_|  |__   ____ |  | |  |   ____   ____  
\   __\  |  \_/ __ \|  | |  |  /  _ \ / ___\ 
 |  | |   Y  \  ___/|  |_|  |_(  <_> ) /_/  >
 |__| |___|  /\___  >____/____/\____/\___  / 
           \/     \/                /_____/  

--]]
local skeleton_plugins = {
  'plugins',
  'general',
  'keymaps',
  'completion',
  'lsp'
}

for k, v in pairs(skeleton_plugins) do
  require(v)
end

-- Load colorsheme
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]
