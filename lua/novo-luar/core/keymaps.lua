-- The only things definded here is <Leader> and Lexplore
-- just incase somthing breaks.
-- For all other keybindings see novo-luar/plugins/which-key.lua.

vim.g.mapleader = " "

--Custom Functions/Vars
local map_options = { noremap = true, silent = true }

local function set_keymap(mode, new, old)
    vim.keymap.set(mode, new, old, map_options)
end
--[[ Explore ]]
-- Leaving this just incase something breaks...
set_keymap('n', '<Leader>dc', ':30Lexplore %:p:h<CR>') -- current directory
set_keymap('n', '<Leader>dl', ':30Lexplore<CR>') -- close & open lexplore


