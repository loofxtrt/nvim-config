-- importar configurações do kickstart
require 'kickstart.init'

-- importar keymaps
local keymaps_path = vim.fn.stdpath 'config' .. '/lua/keymaps.lua'
if vim.fn.filereadable(keymaps_path) == 1 then
  dofile(keymaps_path)
end

-- clonar o repositório do lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

  -- erro
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

-- carregar o lazy.nvim com os plugins e as configurações de cada um
require('lazy').setup {
  require 'kickstart.default-setup', -- importar os plugins nativos do kickstart.nvim, por eles serem escritos num .lua só, o require é o suficiente
  { import = 'plugins' }, -- importar todos os arquivos .lua (cada .lua é um plugin) do diretório de plugins
  { import = 'colorschemes' }, -- importar os colorschemes
}

-- aplicar um colorscheme consistentemente
vim.cmd.colorscheme 'oxocarbon'

-- options
require 'options'
