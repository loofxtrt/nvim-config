-- importar configurações do kickstart
require('kickstart.init') -- geral
require('kickstart.manager') -- lazy.nvim

-- keymaps
local keymaps_path = vim.fn.stdpath 'config' .. '/lua/keymaps.lua'
if vim.fn.filereadable(keymaps_path) == 1 then
  dofile(keymaps_path)
end
