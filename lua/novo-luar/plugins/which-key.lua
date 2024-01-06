local builtin = require('telescope.builtin')

return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    -- Setup which-key
    local wk = require('which-key')
    wk.setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }

    -- Register your keybindings
    wk.register({
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
        ['.'] =  {builtin.find_files, 'Telescope find_files'},
        g = {
          name = 'Telescope options',
          -- Telescope
          f =  {builtin.git_files, 'Telescope git_files'},
          p =  {builtin.live_grep, 'Telescope ripgrep'},
        },
        m = {
          name = 'Mini Options',
          -- Mini
          -- [[ Files Cheetsheet]]
          --[[______________________________________________________________
          |close = 'q'      | go_in = 'l'            | go_in_plus  = 'L'|
          |go_out = 'h'     | go_out_plus = 'H'      | reset = '<BS>'   | 
          |reveal_cwd  = '@'| show_help   = 'g?'     | synchronize = '='| 
          |trim_left   = '<'| trim_right  = '>'      |
          -------------------------------------------------------------]]
          f = { '<cmd>lua MiniFiles.open()<CR>', 'MiniFiles' }  -- Corrected line
        },
    }, { prefix = '<leader>' })
  end
}
