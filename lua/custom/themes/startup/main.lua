ascii_banner = {
  [[                                          ,,                    ]],
  [[`7MN.   `7MF'                             db                    ]],
  [[  MMN.    M                                                     ]],
  [[  M YMb   M  .gP"Ya   ,pW"Wq.`7M'   `MF'`7MM  `7MMpMMMb.pMMMb.  ]],
  [[  M  `MN. M ,M'   Yb 6W'   `Wb VA   ,V    MM    MM    MM    MM  ]],
  [[  M   `MM.M 8M"""""" 8M     M8  VA ,V     MM    MM    MM    MM  ]],
  [[  M     YMM YM.    , YA.   ,A9   VVV      MM    MM    MM    MM  ]],
  [[.JML.    YM  `Mbmmd'  `Ybmd9'     W     .JMML..JMML  JMML  JMML.]],
}

local settings = {
  -- every line should be same width without escaped \
  header = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Header',
    margin = 5,
    content = ascii_banner,
    highlight = 'Statement',
    default_color = '',
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = 'mapping',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Basic Commands',
    margin = 5,
    content = {
      { '󰮗 Find File', 'Telescope find_files', '<leader>ff' },
      { '󰛔 Find Word', 'Telescope live_grep', '<leader>lg' },
      { '󱋢 Recent Files', 'Telescope oldfiles', '<leader>of' },
      { ' File Browser', 'Telescope file_browser', '<leader>fb' },
      { ' Colorschemes', 'Telescope colorscheme', '<leader>cs' },
      { ' New File', "lua require'startup'.new_file()", '<leader>nf' },
    },
    highlight = 'String',
    default_color = '',
    oldfiles_amount = 0,
  },
  footer = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Footer',
    margin = 5,
    content = { 'startup.nvim' },
    highlight = 'Number',
    default_color = '',
    oldfiles_amount = 0,
  },

  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 3, 3, 0 },
  },
  mappings = {
    execute_command = '<CR>',
    open_file = 'o',
    open_file_split = '<c-o>',
    open_section = '<TAB>',
    open_help = '?',
  },
  colors = {
    background = '#1f2227',
    folded_section = '#56b6c2',
  },
  parts = { 'header', 'body', 'footer' },
}
return settings
