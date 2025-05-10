return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = 16,
    open_mapping = [[<c-t>]], -- keymap pra abrir o terminal
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
  },
}
