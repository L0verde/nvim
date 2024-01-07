local builtin = require('telescope.builtin')
-- [[ Harpoon ]] 
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
--

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local wk = require('which-key')
    -- Setup which-key
    wk.setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }

    -- Register your keybindings
    wk.register({
      ['.'] =  {builtin.find_files, 'Telescope find_files'},
      g = {
        name = 'Telescope options',
        -- Telescope
        f =  {builtin.git_files, 'Telescope git_files'},
        p =  {builtin.live_grep, 'Telescope ripgrep'},
      },
      h = {
        name = 'Harpoon',
        -- Impales some files
        a = {function() harpoon:list():append() end, 'Append'},
        -- View your shish kabob
        b = {function() harpoon.ui:toggle_quick_menu(harpoon:list()) end , 'Buffer List'},
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
      u = {'<cmd>UndotreeToggle<CR>', 'Undo Tree' },
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
