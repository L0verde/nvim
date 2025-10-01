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
set_keymap("n", "[d", function() trouble.next({}) end)
set_keymap("n", "]d", function() trouble.previous({}) end)


--[[ToggleTerm]]
require("toggleterm")
set_keymap('t', '<C-[>', [[<C-\><C-N>]])
-- Function to set terminal keymaps
set_keymap('t', '<C-c>', '<C-\\><C-n><C-c>')

--[[Snippets]]
-- Expand snippets in insert mode with Tab
local ls = require("luasnip")

vim.keymap.set('i', '<Tab>', function()
  local ls = require("luasnip")
  if ls.expandable() then
    return vim.fn["luasnip#expand_snippet"]()
  else
    local n = vim.bo.softtabstop
    if n == 0 then n = vim.bo.shiftwidth end
    if n == 0 then n = 2 end
    return string.rep(" ", n)
  end
end, { noremap = true, expr = true, silent = true })


-- Expand snippet in insert mode
set_keymap('i', '<C-K>', function() ls.expand() end)

-- Jump forward through tabstops in insert and select mode
set_keymap({'i', 's'}, '<C-L>', function() ls.jump(1) end)

-- Jump backward through tabstops in insert and select mode
set_keymap({'i', 's'}, '<C-J>', function() ls.jump(-1) end)

-- Change snippet choice in insert and select mode
set_keymap({'i', 's'}, '<C-E>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

--[[Which-Key Setup]]
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local wk = require('which-key')
    -- Setup which-key
    wk.setup {
        icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "󱁐", -- symbol used between a key and its label
        group = "+", -- symbol prepended to a group
      },

    }

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
        n = { ':ToggleTerm direction=horizontal size=', 'horizontal size'},
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

