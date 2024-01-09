return {
  -- Plenary: Module for asynchronous programming using coroutines
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use

  -- Undoo Tree: Visualizes the undo history and makes it 
  --             easy to browse and switch between different undo branches
  'mbbill/undotree',

  --[[ Git ]]
  -- Fugitive: Vim plugin for Git
  'tpope/vim-fugitive',

  --[[LaTeX]]
  --Vimtex
  'lervag/vimtex',

  -- [[ Quality of Life ]]
  -- Harpoon: Buffers from Emacs but better
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
}
