-- Keymaps 
--  1. Defines <Leader>
--  2. Anything that doesn't need the leader key except Lex
-- All other keybindings see novo-luar/plugins/which-key.lua.

vim.g.mapleader = " "

--Custom Functions/Vars
local map_options = { noremap = true, silent = true }

local function set_keymap(mode, new, old)
    vim.keymap.set(mode, new, old, map_options)
end
--[[ Tab ]]
-- Cycle buffers with Tab/Shift-Tab
set_keymap("n", "<Tab>", ":bnext<CR>")
set_keymap("n", "<S-Tab>", ":bprev<CR>")

--[[ Explore ]]
-- Leaving this just incase something breaks...
set_keymap('n', '<leader>dc', ':30Lexplore %:p:h<CR>') -- current directory
set_keymap('n', '<leader>dl', ':30Lexplore<CR>') -- close & open lexplore

--[[ Visual Mode ]]
set_keymap('x', 'K', ":move '<-2<CR>gv-gv")
set_keymap('x', 'J', ":move '>+1<CR>gv-gv")

--[[ LSP and Trouble ]]
-- LSP and Trouble Keybindings
set_keymap("n", "gd", function() vim.lsp.buf.definition() end)
set_keymap("n", "K", function() vim.lsp.buf.hover() end)
set_keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
