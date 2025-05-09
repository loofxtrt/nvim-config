local keymap = vim.keymap.set

--  TODO: ctrl + d

-- ctrl + a pra selecionar o arquivo inteiro
keymap('n', '<C-a>', 'ggVG', { noremap = true })
keymap('v', '<C-a>', 'ggVG', { noremap = true }) -- modo visual
keymap('i', '<C-a>', '<Esc>ggVG', { noremap = true }) -- modo insert

-- ctrl + c pra copiar (dentro do Vim)
keymap('n', '<C-c>', '"+y', { noremap = true })
keymap('v', '<C-c>', '"+y', { noremap = true }) -- modo visual

-- ctrl + v pra colar (dentro do Vim)
keymap('n', '<C-v>', '"+p', { noremap = true })
keymap('v', '<C-v>', '"+p', { noremap = true }) -- modo visual

-- ctrl + x pra recortar (dentro do Vim)
keymap('n', '<C-x>', '"+d', { noremap = true })
keymap('v', '<C-x>', '"+d', { noremap = true }) -- modo visual

-- ctrl + shift + setas
keymap('n', '<C-S-Right>', 'vaw', { noremap = true }) -- seleciona palavra na direita
keymap('n', '<C-S-Left>', 'vaw', { noremap = true }) -- seleciona palavra na esquerda
keymap('n', '<C-S-Up>', 'vaw', { noremap = true }) -- seleciona palavra em baixo
keymap('n', '<C-S-Down>', 'vaw', { noremap = true }) -- seleciona palavra em cima

-- ctrl + s pra salvar
keymap('n', '<C-s>', ':w<CR>', { noremap = true })
keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true })

-- backspace
keymap('v', '<BS>', '"_d', { noremap = true })
keymap('n', '<BS>', '"_d', { noremap = true })
keymap('i', '<C-h>', '<C-w>', { noremap = true }) -- ctrl + backspace apaga a palavra inteira atrás do cursor

-- undo, redo
keymap('n', '<C-z>', '<Nop>', { noremap = true }) -- evitar o comportamento padrão do vim de ficar suspenso com ctrl + z
keymap({ 'n', 'i' }, '<C-z>', '<C-o>u', { noremap = true }) -- ctrl + z
keymap({ 'n', 'i' }, '<C-y>', '<C-o><C-r>', { noremap = true }) -- ctrl + y
