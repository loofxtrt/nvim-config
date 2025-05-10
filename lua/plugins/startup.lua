return {
  'startup-nvim/startup.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    -- importar o plugin startup e rodar o setup com o tema custom
    require('startup').setup(require 'startup.main')
  end,
}
