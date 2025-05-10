local keymap = vim.keymap.set

--  TODO:

--  FIX:
--  ctrl + shift + setas não seleciona a palavra na qual o cursor estava quando o comando foi chamado
--  ctrl + d

--  INFO: (keymaps padrão)
--  ctrl + h -> janela da esquerda (neotree)
--  ctrl + l -> janela da direita (código)
--  ctrl + k -> janela de cima (código)
--  ctrl + j -> janela de baixo (terminal)

-- functions
local no_break_next_word = function()
  -- função que permite ctrl + setas pra direita e esquerda não façam o cursor pular pra próxima linha ao chegar na última palavra
  -- ao invés disso, o cursor para depois da última palavra, apenas parando de se mover caso não tenha mais caracteres no lado direito dele

  local line = vim.fn.getline '.'
  local col = vim.fn.col '.' -- posição atual do cursor (1-based)
  local len = #line

  if col > len then
    return
  end -- já tá no fim da linha

  local after_cursor = line:sub(col)
  local _, word_end = after_cursor:find('^%W*(%w+)', 1) -- pega a próxima palavra

  if word_end then
    local new_col = col + word_end -- posição do fim da palavra
    if new_col > len then
      new_col = len + 1 -- garante que pare no fim da linha
    end
    vim.api.nvim_win_set_cursor(0, { vim.fn.line '.', new_col })
  end
end

-- desativar keymaps
keymap('n', '<C-t>', '<Nop>') -- desativa o ctrl + t padrão (o toggleterm foi configurado pra usar ele no lugar)

-- ctrl + a pra selecionar o arquivo inteiro
keymap('n', '<C-a>', 'ggVG', { noremap = true })
keymap('v', '<C-a>', 'ggVG', { noremap = true }) -- modo visual
keymap('i', '<C-a>', '<Esc>ggVG', { noremap = true }) -- modo insert

-- ctrl + c pra copiar (dentro do Vim)
keymap('n', '<C-c>', '"+y', { noremap = true })
keymap('v', '<C-c>', '"+y', { noremap = true }) -- modo visual

-- ctrl + shift + v pra colar (dentro do Vim)
keymap('n', '<C-v>', '"+p', { noremap = true })
keymap('v', '<C-v>', '"+p', { noremap = true }) -- modo visual

-- ctrl + x pra recortar (dentro do Vim)
keymap('n', '<C-x>', '"+d', { noremap = true })
keymap('v', '<C-x>', '"+d', { noremap = true }) -- modo visual

-- ctrl + shift + setas (modo normal)
keymap('n', '<C-S-Right>', 'vaw', { noremap = true }) -- seleciona palavra na direita
keymap('n', '<C-S-Left>', 'vaw', { noremap = true }) -- seleciona palavra na esquerda
keymap('n', '<C-S-Up>', 'vaw', { noremap = true }) -- seleciona palavra em baixo
keymap('n', '<C-S-Down>', 'vaw', { noremap = true }) -- seleciona palavra em cima

-- ctrl + shift + setas (modo insert)
keymap('i', '<C-Right>', no_break_next_word, { noremap = true }) -- seleciona palavra na direita
keymap('i', '<C-S-Left>', '<Esc>vawi', { noremap = true }) -- seleciona palavra na esquerda
keymap('i', '<C-S-Up>', '<Esc>vawi', { noremap = true }) -- seleciona palavra em baixo
keymap('i', '<C-S-Down>', '<Esc>vawi', { noremap = true }) -- seleciona palavra em cima

-- ctrl + s pra salvar
keymap('n', '<C-s>', ':w<CR>', { noremap = true })
keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true }) -- modo insert

-- backspace
keymap('v', '<BS>', '"_d', { noremap = true }) -- faz backspace deletar a seleção atual
keymap('n', '<BS>', '"_d', { noremap = true }) -- modo normal

keymap('i', '<C-h>', '<C-w>', { noremap = true }) -- ctrl + backspace apaga a palavra inteira atrás do cursor

-- undo, redo
keymap('n', '<C-z>', '<Nop>', { noremap = true }) -- evitar o comportamento padrão do vim de ficar suspenso com ctrl + z
keymap({ 'n', 'i' }, '<C-z>', '<C-o>u', { noremap = true }) -- ctrl + z
keymap({ 'n', 'i' }, '<C-y>', '<C-o><C-r>', { noremap = true }) -- ctrl + y
