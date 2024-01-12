--Custom Functions/Vars
local map_options = { noremap = true, silent = true }

local function set_keymap(mode, new, old)
    vim.keymap.set(mode, new, old, map_options)
end

--[[Telescope]]
local builtin = require('telescope.builtin')

--[[Harpoon]]
local harpoon = require('harpoon')
-- REQUIRED
harpoon:setup()

--[[Trouble]]
local trouble = require('trouble')

local term = require("toggleterm")

vim.api.nvim_set_keymap('t', '<C-[>', [[<C-\><C-n>]], {noremap = true, silent = true})

vim.keymap.set("n", "[d", function() trouble.next({}) end)
vim.keymap.set("n", "]d", function() trouble.previous({}) end)


return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local wk = require('which-key')
    -- Setup which-key
    wk.setup {}

    -- Register your keybindings
    wk.register({
      ['.'] =  {builtin.find_files, 'Telescope find_files'},
      ['/'] = {':set hlsearch!<CR>', 'Highlighting Toggle' },
      g = {
        name = 'Telescope options',
        -- Telescope
        f =  {builtin.git_files, 'Telescope git_files'},
        p =  {builtin.live_grep, 'Telescope ripgrep'},
        s =  {builtin.git_status, 'Git status'},
      },
      h = {
        name = 'Harpoon',
        -- Impales some files
        a = {function() harpoon:list():append() end, 'Append'},
        -- View your shish kabob
        h = {function() harpoon.ui:toggle_quick_menu(harpoon:list()) end , 'Buffer List'},
        -- Jump to specific nodes
        y = {function() harpoon:list():select(1) end, 'Buffer 1'},
        u = {function() harpoon:list():select(2) end, 'Buffer 2'},
        i = {function() harpoon:list():select(3) end, 'Buffer 3'},
        o = {function() harpoon:list():select(4) end, 'Buffer 4'},
        -- Prev & Next
        p = {function() harpoon:list():prev() end, 'Prev'},
        n = {function() harpoon:list():next() end, 'Next'},
      },
      m = {
        name = 'Mini Options',
        -- Mini
        f = { '<cmd>lua MiniFiles.open()<CR>', 'MiniFiles' }  -- Corrected line
      },
      t = {
        name = 'Toggle',
        r = {function() trouble.toggle() end, 'Trouble'},
        t = {function() vim.cmd('ToggleTerm direction=horizontal size=5') end, 'Term Horizontal'},
        g = {function() vim.cmd('ToggleTerm direction=float') end, 'Term Float'},
        s = { ':ToggleTerm direction=horizontal size=', 'horizontal size'},
      },
      u = {'<cmd>UndotreeToggle<cr>', 'undo tree' },
      v = {
        name = "LSP",
        w = {s = {function() vim.lsp.buf.workspace_symbol() end, 'Workspace Symbol'},},
        d = {function() vim.diagnostic.open_float() end, 'Open Diagnostic'},
        c = {a = {function() vim.lsp.buf.code_action() end, 'Code Action'},},
        r ={
          r = {function() vim.lsp.buf.references() end, 'References'},
          n = {function() vim.lsp.buf.rename() end, 'Rename'},
        },
      },
      w = {
        name = 'Windows', -- group name
        -- Window splits
        c = { '<cmd>q<CR>', 'Close window' },
        n = { '<cmd>vnew<CR>', 'New window' },
        s = { '<cmd>split<CR>', 'Horizontal split window' },
        v = { '<cmd>vsplit<CR>', 'Vertical split window' },
        -- Window motions
        h = { '<C-w>h', 'Window left' },
        j = { '<C-w>j', 'Window down' },
        k = { '<C-w>k', 'Window up' },
        l = { '<C-w>l', 'Window right' },
        w = { '<C-w>w', 'Goto next window' },
      },
    }, { prefix = '<leader>' })
  end
}

